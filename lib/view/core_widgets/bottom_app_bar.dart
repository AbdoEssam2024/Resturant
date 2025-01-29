import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import '../../core/constant/colors/app_colors.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/screen_size/screen_size.dart';
import '../../core/functions/bottom_bar_navigation.dart';

class CustomBottomAppBar extends GetView<HomeController> {
  final int? initIndex ;
  const CustomBottomAppBar({super.key , this.initIndex});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(
      {3: "3"},
      badgeMargin: EdgeInsets.only(
          left: ScreenSize.screenWidth * 0.05,
          bottom: ScreenSize.screenHeight * 0.022),
      badgeColor: AppColors.white,
      badgeTextColor: AppColors.red,
      badgeBorderRadius: 100.sp,
      items: [
        TabItem(icon: Image.asset(AppImages.nav_3)),
        TabItem(icon: Image.asset(AppImages.nav_2)),
        TabItem(icon: Image.asset(AppImages.nav_1)),
        TabItem(icon: Image.asset(AppImages.nav_4)),
        TabItem(icon: Image.asset(AppImages.nav_5)),
      ],
      backgroundColor: AppColors.orange,
      activeColor: AppColors.black,
      curve: Curves.easeInOut,
      curveSize: 120.sp,
      onTap: (index) {

        bottomBarNavigate(index);
      },
      initialActiveIndex: initIndex,
    );
  }
}