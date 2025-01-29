import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/auth/login/login_data.dart';
import 'package:resturant_anj/main.dart';

class LoginController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool showPass = true;
  enterUser() async {
    var formData = loginFormKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.enterUser(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          sharedPreferences.setInt("visit", 2);
          sharedPreferences.setInt("id", response['data']['id']);
          sharedPreferences.setString("name", response['data']['user_name']);
          sharedPreferences.setString(
              "email", response['data']['user_email']);
          goToHomePage();
        } else {
          Get.snackbar("Failed", "This Account Don't Exist");
        }
      }
    } else {
      return "Invalid Inputs ";
    }
    update();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    sharedPreferences.setInt("visit", 2);
    goToHomePage();
  }

  goToHomePage() {
    Get.offNamed(AppRoutesNames.homeScreen);
  }

  goToSignUp() {
    Get.offNamed(AppRoutesNames.signUpScreen);
  }

  goToForgetPassword() {
    Get.offNamed(AppRoutesNames.forgetPassword);
  }

  showPassword() {
    showPass = !showPass;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}