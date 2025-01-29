import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/splash/splash_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/data/const_data/splash_data/splash_data.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ScreenSize.screenWidth * 0.2,
                    height: ScreenSize.screenHeight * 0.1,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween(
                            begin: 0.0,
                            end: (controller.currentPage.toDouble() + 1.0) /
                                splash.length.toDouble(),
                          ),
                          duration: Duration(seconds: 1),
                          builder: (context, value, _) =>
                              CircularProgressIndicator(
                            strokeAlign: BorderSide.strokeAlignInside,
                            strokeWidth: 6.0,
                            backgroundColor: AppColors.white,
                            value: value,
                            valueColor:
                                AlwaysStoppedAnimation(AppColors.orange),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 25,
                          child: Text(
                            "${controller.currentPage + 1} ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grey,
                                fontFamily: "cairo"),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 18,
                          child: Text("/",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey,
                                  fontFamily: "cairo")),
                        ),
                        Positioned(
                          left: 45,
                          top: 23,
                          child: Text(" ${splash.length}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey,
                                  fontFamily: "cairo")),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.screenWidth * 0.4,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.screenHeight * 0.02),
                      color: AppColors.orange,
                      textColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        controller.goToNextPage();
                      },
                      child: Text(
                        controller.currentPage == 2 ? "Start" : "Next",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}