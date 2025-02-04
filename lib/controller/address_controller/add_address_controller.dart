import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/auth/user_data/add_user_address.dart';
import 'package:resturant_anj/main.dart';

import '../../core/constant/colors/app_colors.dart';

class AddAddressController extends GetxController {
  late TextEditingController addressTitle;
  late TextEditingController address;
  late int userId;
  List userAddress = [];

  StatusRequest statusRequest = StatusRequest.none;
  AddUserAddress addUserAddress = AddUserAddress(Get.find());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addNewAddress(BuildContext cont) async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      if (userAddress.length < 3) {
        statusRequest = StatusRequest.loading;
        var response = await addUserAddress.addUserAddress(
            userId, addressTitle.text, address.text);
        statusRequest = handlingData(response);
        if (response['status'] == "success") {
          if (statusRequest == StatusRequest.success) {
            AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: cont,
                    dismissOnTouchOutside: false,
                    dialogType: DialogType.success,
                    title: "Success",
                    body: Text("Address Added Successfully"),
                    btnOkText: "Back To Address Screen",
                    btnOkColor: AppColors.orange,
                    btnOkOnPress: () {
                      Get.offNamed(AppRoutesNames.userAddressScreen);
                    },
                    btnCancelColor: AppColors.otpaccentDarkGreenColor,
                    btnCancelText: "Back To Home Screen",
                    btnCancelOnPress: () {
                      Get.offNamed(AppRoutesNames.homeScreen);
                    },
                    buttonsTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold))
                .show();
          } else {
            Get.snackbar(
                "Failed", "Address Added Failed , Please Try Again Later");
          }
        }
      } else {
        Get.snackbar("Address Count", "Can't Add More Than 3 Address");
      }
    }

    update();
  }

  getUserId() {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
    userAddress = Get.arguments['address'];
  }

  initializeControllers() {
    addressTitle = TextEditingController();
    address = TextEditingController();
  }

  disposeControllers() {
    addressTitle.dispose();
    address.dispose();
  }

  @override
  void onInit() {
    getUserId();
    initializeControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}