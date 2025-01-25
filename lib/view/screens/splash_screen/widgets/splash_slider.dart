import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:resturant_anj/controller/splash/splash_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/data/const_data/splash_data/splash_data.dart';
import 'package:resturant_anj/view/screens/splash_screen/widgets/splash_skip_btn.dart';

class SplashSlider extends StatelessWidget {
  const SplashSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find();
    return SizedBox(
      height: ScreenSize.screenHeight * 0.75,
      child: PageView.builder(
          onPageChanged: (value) {
            controller.onChangePage(value);
          },
          controller: controller.pageController,
          itemCount: splash.length,
          itemBuilder: (context, index) => Stack(
                children: [
                  SizedBox(
                      width: ScreenSize.screenWidth,
                      child: Image.asset(
                        splash[index].image!,
                        fit: BoxFit.cover,
                      ).animate().fadeIn(
                          duration: 3.seconds, curve: Curves.easeInOut)),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.screenHeight * 0.03),
                      height: ScreenSize.screenHeight * 0.3,
                      width: ScreenSize.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                        color: AppColors.white,
                      ),
                      child: Column(
                        spacing: ScreenSize.screenHeight * 0.005,
                        children: [
                          Image.asset(
                            splash[index].icon!,
                            width: 50,
                            height: 40,
                          ),
                          Text(
                            splash[index].title!,
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 24.sp,
                                fontFamily: "cairo"),
                          )
                              .animate(
                                  onComplete: (controller) =>
                                      controller.reverse())
                              .align(
                                  duration: 2.seconds,
                                  curve: Curves.easeInOut,
                                  begin: Alignment.center,
                                  end: Alignment.centerRight),
                          Text(
                            splash[index].body!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black, fontFamily: "cairo"),
                          ).animate().slideY(
                              duration: 2.seconds, curve: Curves.easeInOut),
                        ],
                      ),
                    ),
                  ),
                  SkipButton(),
                ],
              )),
    );
  }
}