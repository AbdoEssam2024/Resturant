import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';

class OrdersTabBar extends GetView<OrdersController> {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorAnimation: TabIndicatorAnimation.linear,
        controller: controller.tabController,
        labelStyle: TextStyle(
            color: AppColors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp),
        unselectedLabelStyle: TextStyle(
            letterSpacing: 1,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp),
        indicatorColor: Colors.transparent,
        tabs: [
          TabsWidget(
            text: "Active",
          ),
          TabsWidget(
            text: "Complete",
          ),
          TabsWidget(
            text: "Canceled",
          ),
        ]);
  }
}

class TabsWidget extends GetView<OrdersController> {
  final String text;

  const TabsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: ScreenSize.screenWidth * 0.3,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: ScreenSize.screenHeight * 0.005,
        ),
        decoration: BoxDecoration(
            color: AppColors.orange, borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
        ),
      ),
    );
  }
}