import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/splash/splash_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/data/const_data/splash_data/splash_data.dart';

class SplashDots extends StatelessWidget {
  const SplashDots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    splash.length,
                    (index) => AnimatedContainer(
                          decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          duration: Duration(milliseconds: 900),
                          margin: EdgeInsets.symmetric(
                              horizontal: ScreenSize.screenWidth * 0.02,
                              vertical: ScreenSize.screenHeight * 0.02),
                          width: controller.currentPage == index ? 25 : 6,
                          height: 5,
                        )),
              ],
            ));
  }
}