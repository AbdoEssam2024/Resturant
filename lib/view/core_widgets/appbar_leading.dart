import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/signup/signup_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

class AppBarLeading extends GetView<SignupController> {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToLoginPage();
        },
        child: Container(
          margin: EdgeInsets.only(left: ScreenSize.screenWidth * 0.05),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
            size: 30,
          ),
        ));
  }
}