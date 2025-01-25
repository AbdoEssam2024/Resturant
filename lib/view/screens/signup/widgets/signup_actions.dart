import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/signup/signup_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/core_widgets/auth_btn.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';

class SignUpActions extends GetView<SignupController> {
  const SignUpActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        AuthButton(
          btnColor: AppColors.orange,
          textColor: AppColors.white,
          text: "Sign Up",
          btnFunc: () {
            controller.addUser();
          },
          btnWidth: ScreenSize.screenWidth * 0.6,
        ),
        Row(
          children: [
            Expanded(
                child: Divider(
                  thickness: 2,
                  color: AppColors.grey,
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.02),
              child: AuthText(text: "Or", textColor: AppColors.black, size: 20),
            ),
            Expanded(
                child: Divider(
                  thickness: 2,
                  color: AppColors.grey,
                )),
          ],
        ),
        Container(
          width: ScreenSize.screenWidth * 0.6,
          decoration: BoxDecoration(
              color: AppColors.orange, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              AuthButton(
                text: "Sign Up With Google",
                btnFunc: () {
                  controller.signInWithGoogle();
                },
                textColor: AppColors.white,
              ),
              Icon(
                Icons.g_translate,
                color: AppColors.white,
                size: 30,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthText(
                text: "Have Account ?", textColor: AppColors.black, size: 12),
            TextButton(
                onPressed: () {
                  controller.goToLoginPage();
                },
                child: AuthText(
                    text: "Log In", textColor: AppColors.orange, size: 18))
          ],
        )
      ],
    );
  }
}