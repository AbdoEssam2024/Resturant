import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/splash/splash_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/view/screens/splash_screen/widgets/splash_btn.dart';
import 'package:resturant_anj/view/screens/splash_screen/widgets/splash_dots.dart';
import 'package:resturant_anj/view/screens/splash_screen/widgets/splash_slider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        backgroundColor: AppColors.offWhite,
        body: SafeArea(
            child: Column(
          children: [
            SplashSlider(),
            SplashDots(),
            SplashButton(),
          ],
        )));
  }
}