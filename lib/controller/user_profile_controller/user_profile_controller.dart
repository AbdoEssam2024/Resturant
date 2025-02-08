import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/user_data/update_user_data.dart';
import 'package:resturant_anj/main.dart';

class UserProfileController extends GetxController {
  UpdateUserData updateUserData = UpdateUserData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late int userId;
  late String userName;
  late String userEmail;
  late String userBirthDate;
  late int userPhone;

  late TextEditingController name;

  late TextEditingController birthDate;

  late TextEditingController email;

  late TextEditingController phone;

  getUserData() {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
    if (sharedPreferences.getString("name") == null) {
      userName = "";
    } else {
      userName = sharedPreferences.getString("name")!;
    }
    if (sharedPreferences.getString("email") == null) {
      userEmail = "";
    } else {
      userEmail = sharedPreferences.getString("email")!;
    }
    if (sharedPreferences.getString("birthdate") == null) {
      userBirthDate = "";
    } else {
      userBirthDate = sharedPreferences.getString("birthdate")!;
    }
    if (sharedPreferences.getInt("phone") == null) {
      userPhone = 0;
    } else {
      userPhone = sharedPreferences.getInt("phone")!;
    }
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
      birthDate.text = selected.toString().split(" ")[0];
    }
    update();
  }

  initializeControllers() {
    name = TextEditingController(text: userName);
    birthDate = TextEditingController(text: userBirthDate);
    email = TextEditingController(text: userEmail);
    phone = TextEditingController(text: userPhone.toString());
  }

  disposeControllers() {
    name.dispose();
    birthDate.dispose();
    email.dispose();
    phone.dispose();
  }

  updateUserDataFunc() async {
    statusRequest = StatusRequest.loading;
    var response = await updateUserData.updateUserData(
        userId, name.text, email.text, birthDate.text, phone.text);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest == StatusRequest.success) {
        sharedPreferences.setString("name", name.text);
        sharedPreferences.setString("email", email.text);
        sharedPreferences.setInt("phone", int.parse(phone.text));
        sharedPreferences.setString("birthdate", birthDate.text);
        getUserData();
        Get.snackbar("Success", "Profile Data Updated Successfully");
      }
    } else {
      Get.snackbar("Failed", "Couldn't Update Non Changes");
    }

    update();
  }

  @override
  void onInit() {
    getUserData();
    initializeControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}