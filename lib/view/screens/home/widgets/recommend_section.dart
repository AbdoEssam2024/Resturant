import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/model/home/recommended_model.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';

class RecommendSection extends GetView<HomeController> {
  const RecommendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.02),
        color: AppColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                    color: AppColors.brown,
                    fontSize: 24.sp,
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                  iconAlignment: IconAlignment.end,
                  label: Text(
                    "View All",
                    style: TextStyle(
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios, color: AppColors.orange))
            ],
          ),
          SizedBox(
            height: ScreenSize.screenHeight * 0.25,
            child: GridView.builder(
                itemCount: controller.recommended.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenSize.screenHeight * 0.002,
                  mainAxisSpacing: ScreenSize.screenWidth * 0.01,
                ),
                itemBuilder: (context, index) => RecommendedItems(
                      recommendedModel: RecommendedModel.fromJson(
                          controller.recommended[index]),
                    )),
          )
        ]));
  }
}

class RecommendedItems extends StatelessWidget {
  final RecommendedModel recommendedModel;

  const RecommendedItems({super.key, required this.recommendedModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            padding: EdgeInsets.all(5.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:
                  Image.asset(fit: BoxFit.cover, recommendedModel.itemImage!),
            ),
          ),
          Positioned(
              top: ScreenSize.screenHeight * 0.02,
              left: ScreenSize.screenWidth * 0.04,
              child: SizedBox(
                width: ScreenSize.screenWidth * 0.5,
                child: Row(
                  spacing: ScreenSize.screenHeight * 0.01,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.screenWidth * 0.02),
                        width: ScreenSize.screenWidth * 0.18,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${recommendedModel.itemRate}",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.brown),
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.yellow,
                            )
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth * 0.01,
                          vertical: ScreenSize.screenHeight * 0.007,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.red,
                        ))
                  ],
                ),
              )),
          Positioned(
              bottom: ScreenSize.screenHeight * 0.05,
              right: ScreenSize.screenWidth * 0.015,
              child: Container(
                width: ScreenSize.screenWidth * 0.15,
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Text("${recommendedModel.itemPrice}\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.white,
                        letterSpacing: 1.5)),
              ))
        ],
      ),
    );
  }
}