import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/verify_signup/verify_signup_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/forget_password/widgets/text_btn.dart';
import 'package:resturant_anj/view/screens/verify_email_signup/widgets/otp_widget.dart';

import '../widgets/appbar_leading_verify.dart';

class VerifyEmailSignUp extends GetView<VerifySignUpController> {
  const VerifyEmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifySignUpController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, controller.goToSignUpPage());
        },
        widget: Scaffold(
          backgroundColor: AppColors.yellowBase,
          appBar: AppBar(
            centerTitle: true,
            title: AuthText(
              text: "Verify Your Otp",
              textColor: AppColors.grey,
              size: 40,
            ),
            toolbarHeight: ScreenSize.screenHeight * 0.15,
            backgroundColor: AppColors.yellowBase,
            leading: InkWell(
              onTap: () {
                controller.goToSignUpPage();
              },
              child: AppBarLeadingVerifyForget(),
            ),
          ),
          body: SafeArea(
              child: Container(
            height: ScreenSize.screenHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                color: AppColors.white),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth * 0.02,
                vertical: ScreenSize.screenHeight * 0.15),
            width: ScreenSize.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                spacing: 30,
                children: [
                  Column(
                    children: [
                      AuthText(
                        text: "Please Enter 6 digits code\nSent To Your Email",
                        textColor: AppColors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                  OtpWidget(
                    onSubmitCode: (String verifycode) {
                      controller.verifyCode = verifycode;
                      controller.verifyCodeCheck();
                    },
                  ),
                  TextBtn(
                      actionText: "Resent",
                      nonActionText: "Don't Recieve The Code ?",
                      func: () {})
                ],
              ),
            ),
          )),
        ));
  }
}