import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/reset_password/reset_password_data.dart';
import 'package:resturant_anj/main.dart';

class PasswordSettingsController extends GetxController {
  late TextEditingController pass;
  late TextEditingController confirmPass;
  late GlobalKey<FormState> formKey;
  late String email;
  bool showPass = true;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  resetPass() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      if (pass.text != confirmPass.text) {
        Get.snackbar("Error", "Password Don't Match");
      } else {
        statusRequest = StatusRequest.loading;
        var response =
            await resetPasswordData.resetPasswordFunc(email, pass.text);
        statusRequest = handlingData(response);

        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.snackbar("Success", "Password Updated Successfully");
          }
        } else {
          statusRequest = StatusRequest.failure;
          Get.snackbar("Failed", "Server Error Please Try Again Later");
        }
      }
    } else {
      return "Invalid Inputs ";
    }
    update();
  }

  initializeControllers() {
    pass = TextEditingController();
    confirmPass = TextEditingController();
    formKey = GlobalKey<FormState>();
    if (sharedPreferences.getString("email") == null) {
      email = "";
    } else {
      email = sharedPreferences.getString("email")!;
    }
  }

  showPassword() {
    showPass = !showPass;
    update();
  }

  disposeControllers() {
    pass.dispose();
    confirmPass.dispose();
  }

  @override
  void onInit() {
    initializeControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
