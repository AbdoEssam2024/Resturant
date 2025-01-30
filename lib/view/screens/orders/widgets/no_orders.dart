import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colors/app_colors.dart';

class NoOrders extends StatelessWidget {
  final String text ;
  const NoOrders({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          textAlign: TextAlign.center,
          "You don't have any $text orders at this time",
          style: TextStyle(
              color: AppColors.orange, fontSize: 26.sp),
        ));
  }
}