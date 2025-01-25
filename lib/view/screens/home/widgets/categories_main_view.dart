import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/main.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/home/catigories_model.dart';

class CategoriesStructure extends GetView<HomeController> {
  const CategoriesStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.02,
        ),
        height: ScreenSize.screenHeight * 0.17,
        width: ScreenSize.screenWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) => CategoriesMainView(
                  categoriesDataModel: CategoriesDataModel.fromJson(
                      controller.categories[index]),
                )));
  }
}

class CategoriesMainView extends GetView<HomeController> {
  final CategoriesDataModel categoriesDataModel;

  const CategoriesMainView({super.key, required this.categoriesDataModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sharedPreferences.clear();
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenSize.screenHeight * 0.03),
        width: ScreenSize.screenWidth * 0.195,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: ScreenSize.screenWidth * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.catBg),
              height: ScreenSize.screenHeight * 0.08,
              child: Image.asset(
                categoriesDataModel.categoryImage!,
              ),
            ),
            Text(
              categoriesDataModel.categoryName!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}