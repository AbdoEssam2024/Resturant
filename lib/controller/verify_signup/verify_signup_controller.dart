import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/verifycodesignup/verifycode_data.dart';

class VerifySignUpController extends GetxController {
  late String userEmail;
  String verifyCode = "";
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  verifyCodeCheck() async {
    statusRequest = StatusRequest.loading;
    var response = await verifyCodeData.verifyCode(userEmail, verifyCode);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest == StatusRequest.success) {
        goToSuccessVerifySignUp();
      }
    } else {
      statusRequest = StatusRequest.failure;
      Get.snackbar("Failed", response['message']);
    }
    update();
  }

  goToSignUpPage() {
    Get.offNamed(AppRoutesNames.signUpScreen);
  }

  goToSuccessVerifySignUp() {
    Get.offNamed(AppRoutesNames.successSignUp);
  }

  @override
  void onInit() {
    userEmail = Get.arguments['email'];
    super.onInit();
  }
}