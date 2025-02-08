import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/verifycodesignup_forget/verifycode_forget_data.dart';

class VerifyForgetPassController extends GetxController {
  late String userEmail;

  String verifyCode = "";
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeForgetData verifyCodeData = VerifyCodeForgetData(Get.find());

  verifyCodeCheck() async {
    statusRequest = StatusRequest.loading;
    var response = await verifyCodeData.verifyCode(userEmail, verifyCode);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest == StatusRequest.success) {
        goToResetPassword();
      }
    } else {
      statusRequest = StatusRequest.failure;
      Get.snackbar("Failed", response['message']);
    }
    update();
  }

  backToForgetPassword() {
    Get.offNamed(AppRoutesNames.forgetPassword);
  }

  goToResetPassword() {
    Get.offNamed(AppRoutesNames.resetPassword, arguments: {"email": userEmail});
  }

  @override
  void onInit() {
    userEmail = Get.arguments['email'];
    super.onInit();
  }
}