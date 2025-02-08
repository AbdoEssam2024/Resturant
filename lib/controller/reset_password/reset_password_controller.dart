import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/reset_password/reset_password_data.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController pass;
  late TextEditingController confirmPass;
  late GlobalKey<FormState> formKey;
  late String email;
  bool showPass = true;

  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

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
            goToSuccessResetPass();
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

  backToVerifyForgetPass() {
    Get.offNamed(AppRoutesNames.verifyForgetPass);
  }

  goToSuccessResetPass() {
    Get.offNamed(AppRoutesNames.successResetPassword);
  }

  showPassword() {
    showPass = !showPass;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    pass = TextEditingController();
    confirmPass = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    pass.dispose();
    confirmPass.dispose();
    super.onClose();
  }
}