import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/core_widgets/auth_btn.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.yellowBase,
        title: AuthText(
          text: "Password Updated",
          textColor: AppColors.grey,
          size: 40,
        ),
      ),
      body: SafeArea(
          child: Container(
            height: ScreenSize.screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              color: AppColors.white
            ),
        margin: EdgeInsets.only(top: ScreenSize.screenHeight * 0.1),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.04 , vertical: ScreenSize.screenHeight * 0.04),
        width: ScreenSize.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            spacing: 80,
            children: [
              Column(
                children: [

                  AuthText(
                    text: "Your Password Updated Successfully\nNow You Can Start",
                    textColor: AppColors.grey,
                    size: 20,
                  ),
                ],
              ),
              Lottie.asset(AppImages.success,
                  width: ScreenSize.screenWidth * 0.5),
              AuthButton(
                  btnColor: AppColors.orange,
                  btnWidth: ScreenSize.screenWidth * 0.6,
                  text: "Go To Login",
                  btnFunc: () {
                    Get.offAllNamed(AppRoutesNames.loginScreen);
                  },
                  textColor: AppColors.white)
            ],
          ),
        ),
      )),
    );
  }
}