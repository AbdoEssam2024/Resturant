import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:resturant_anj/controller/login/login_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/screens/login/widgets/login_actions.dart';
import 'package:resturant_anj/view/screens/login/widgets/login_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellowBase,
        centerTitle: true,
        title: AuthText(
          text: "Log In",
          textColor: AppColors.grey,
          size: 34,
        ).animate().slideY(duration: 2.seconds, curve: Curves.easeInOut),
        toolbarHeight: ScreenSize.screenHeight * 0.2,
      ),
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        height: ScreenSize.screenHeight,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.screenWidth * 0.05,
            vertical: ScreenSize.screenHeight * 0.015),
        width: ScreenSize.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthText(
                text: "Welcome",
                textColor: AppColors.black,
                size: 24,
              ).animate().align(
                  duration: 3.seconds,
                  curve: Curves.easeInOut,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
              AuthText(
                align: TextAlign.start,
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                textColor: AppColors.grey,
                size: 14,
              ),
              LoginInputs(),
              LoginActions(),
            ],
          ),
        ),
      )),
    );
  }
}