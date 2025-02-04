import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/main.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../core_widgets/searchbar.dart';
import 'appbar_icons.dart';

class HomeAppbar extends GetView<HomeController> {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.02,
          vertical: ScreenSize.screenHeight * 0.02),
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight * 0.25,
      color: AppColors.yellowBase,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: CustomSearchBar(func: (val) {}),
              ),
              Row(
                spacing: 10,
                children: [
                  AppbarIcons(
                    icon: Icons.shopping_cart_outlined,
                    func: () {},
                  ),
                  AppbarIcons(
                    icon: Icons.notifications_outlined,
                    func: () {
                      // sharedPreferences.clear();
                    },
                  ),
                  AppbarIcons(
                    icon: Icons.person_2_outlined,
                    func: () {
                      controller.scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Rise and shine! It's breakfast time",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: AppColors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}