import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/images/app_images.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/home/offers_model.dart';

class OffersMainView extends GetView<HomeController> {
  const OffersMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenSize.screenHeight * 0.3,
          child: PageView.builder(
            controller: controller.pageController,
              onPageChanged: (value) {
                controller.onChange(value);
              },
              scrollDirection: Axis.horizontal,
              itemCount: controller.offers.length,
              itemBuilder: (context, index) => OffersView(
                    offersModel: OffersModel.fromJson(controller.offers[index]),
                  )),
        ),
        Container(
            padding: EdgeInsets.only(bottom: ScreenSize.screenHeight * 0.015),
            color: AppColors.white,
            child: GetBuilder<HomeController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: ScreenSize.screenWidth * 0.015,
                children: [
                  ...List.generate(
                      controller.offers.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.goToNextPage(index);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                              color: controller.currentPage == index
                                  ? AppColors.orange
                                  : AppColors.yellowBase,
                              borderRadius: BorderRadius.circular(50)),
                          width: ScreenSize.screenWidth * 0.08,
                          height: ScreenSize.screenHeight * 0.01,
                        ),
                      ))
                ],
              ),
            ))
      ],
    );
  }
}

class OffersView extends GetView<HomeController> {
  final OffersModel offersModel;

  const OffersView({super.key, required this.offersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Container(
              color: Colors.white,
              width: ScreenSize.screenWidth,
              height: ScreenSize.screenHeight * 0.3,
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.03,
                  vertical: ScreenSize.screenHeight * 0.02),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Positioned(
                      right: 0,
                      child: SizedBox(
                        height: ScreenSize.screenHeight * 0.27,
                        width: ScreenSize.screenWidth * 0.48,
                        child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(50)),
                          child: Image.asset(
                            offersModel.offersImage!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )),
                  Positioned(
                    left: ScreenSize.screenWidth * 0.30,
                    top: ScreenSize.screenWidth * -0.12,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.yellowBase,
                          borderRadius: BorderRadius.circular(80)),
                    ),
                  ),
                  Positioned(
                    left: ScreenSize.screenWidth * 0.325,
                    top: ScreenSize.screenWidth * -0.1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(80)),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Positioned(
                    left: ScreenSize.screenWidth * 0.1,
                    bottom: ScreenSize.screenWidth * -0.135,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.yellowBase,
                          borderRadius: BorderRadius.circular(80)),
                    ),
                  ),
                  Positioned(
                    left: ScreenSize.screenWidth * 0.125,
                    bottom: ScreenSize.screenWidth * -0.11,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(80)),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.screenWidth * 0.45,
                    child: Column(
                      spacing: ScreenSize.screenHeight * 0.008,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          offersModel.offerTitle!,
                          style: TextStyle(
                              height: ScreenSize.screenHeight * 0.0015,
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontFamily: "cairo"),
                        ),
                        Text(
                          "${offersModel.offerDiscount}% OFF",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 30.sp,
                              fontFamily: "cairo"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}