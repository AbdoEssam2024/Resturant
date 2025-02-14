import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/notifications/notifications.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/const_data/sqflite_db.dart';
import 'package:resturant_anj/data/remote_data/auth/user_data/update_user_data.dart';
import 'package:resturant_anj/main.dart';

class UserProfileController extends GetxController {
  UpdateUserData updateUserData = UpdateUserData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  SqfliteDB sqfliteDB = SqfliteDB();
  RxList<Map<String, dynamic>> userData = <Map<String, dynamic>>[].obs;
  late int userId;

  Rx<TextEditingController> name = TextEditingController().obs;

  Rx<TextEditingController> birthDate = TextEditingController().obs;

  Rx<TextEditingController> email = TextEditingController().obs;

  Rx<TextEditingController> phone = TextEditingController().obs;

  getUserData() async {
    statusRequest.value = StatusRequest.loading;
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
    userData.value =
        await sqfliteDB.getData(userId, "user_data", "user_id = $userId");
    name.value.text = userData[0]['user_name'];
    email.value.text = userData[0]['user_email'];

    if (userData[0]['user_birthdate'] == null) {
      birthDate.value.text = "";
    } else {
      birthDate.value.text = userData[0]['user_birthdate'];
    }
    if (userData[0]['user_phone'] == null) {
      phone.value.text = 0.toString();
    } else {
      phone.value.text = userData[0]['user_phone'].toString();
    }
    statusRequest.value = StatusRequest.success;
  }

  backToHomePage() {
    Get.offNamed(AppRoutesNames.homeScreen);
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());
    if (selected != null) {
      birthDate.value.text = selected.toString().split(" ")[0];
    }
  }

  disposeControllers() {
    name.value.dispose();
    birthDate.value.dispose();
    email.value.dispose();
    phone.value.dispose();
  }

  updateUserDataFunc() async {
    statusRequest.value = StatusRequest.loading;
    var response = await updateUserData.updateUserData(userId, name.value.text,
        email.value.text, birthDate.value.text, phone.value.text);
    statusRequest.value = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest.value == StatusRequest.success) {
        sqfliteDB.updateData(
            table: "user_data",
            data:
                "user_name = '${name.value.text}' , user_email = '${email.value.text}' , user_birthdate = '${birthDate.value.text}' , user_phone = ${phone.value.text}",
            where: "user_id = $userId");
        getUserData();
        String successTitle = "Success";
        String successBody = "Profile Data Updated Successfully";
        Notifications.showOnceNotification(
            title: successTitle, body: successBody);
        sqfliteDB.insertData(
            table: "notifications",
            columns:
                "user_id , notificaion_image , notificaion_title , notificaion_body",
            values:
                "$userId , '${AppImages.cancel}' , '$successTitle' , '$successBody'");
      }
    } else {
      String failedTitle = "Failed";
      String failedBody =
          "Cannot Update Non Changes , Please Try Again Later";
      Notifications.showOnceNotification(title: failedTitle, body: failedBody);
      sqfliteDB.insertData(
          table: "notifications",
          columns:
              "user_id , notificaion_image , notificaion_title , notificaion_body",
          values:
              "$userId , '${AppImages.cancel}' , '$failedTitle' , '$failedBody'");
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
