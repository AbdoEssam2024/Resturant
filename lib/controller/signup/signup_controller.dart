import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/auth/signup/signup_data.dart';

import '../../main.dart';

class SignupController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  bool showPass = true;

  SignupData signupData = SignupData(Get.find());

  addUser() async {
    var formData = signUpFormKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response =
          await signupData.addUser(name.text, password.text, email.text);
      statusRequest = handlingData(response);
      if (response['status'] == "success") {
        if (statusRequest == StatusRequest.success) {
          goToCheckEmailPage();
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Failed", response['message']);
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

  showPassWord() {
    showPass = !showPass;
    update();
  }

  goToHomePage() {
    Get.offNamed(AppRoutesNames.homeScreen);
  }

  goToCheckEmailPage() {
    Get.offNamed(AppRoutesNames.verifyEmailSignUp,
        arguments: {"email": email.text});
  }

  goToLoginPage() {
    Get.offNamed(AppRoutesNames.loginScreen);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }
}