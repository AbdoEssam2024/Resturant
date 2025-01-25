import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/auth/check_email/check_email.dart';

class ForgetPassController extends GetxController {
  late TextEditingController email;
  late GlobalKey<FormState> formKey;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  checkEmail() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await checkEmailData.checkUserEmail(email.text);
      statusRequest = handlingData(response);
      if (response['status'] == "success") {
        if (statusRequest == StatusRequest.success) {
          goToVerifyForgetPassPage();
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Failed", response["message"]);
      }
    } else {
      return "Invalid Inputs ";
    }
    update();
  }

  backToLoginScreen() {
    Get.offNamed(AppRoutesNames.loginScreen);
  }

  goToVerifyForgetPassPage() {
    Get.offNamed(AppRoutesNames.verifyForgetPass,
        arguments: {"email": email.text});
  }

  @override
  void onInit() {
    email = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}