import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/splash/splash_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';

class SkipButton extends GetView<SplashController> {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 5, right: 10),
        child: TextButton.icon(

          iconAlignment: IconAlignment.end,
          label: Text(
            "Skip",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          icon: Icon(Icons.arrow_forward_ios , color: AppColors.red, size: 14,),
          onPressed: () {
            controller.goToLogin();
          },
        ));
  }
}