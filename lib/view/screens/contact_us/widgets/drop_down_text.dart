import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colors/app_colors.dart';

class DropDownText extends StatelessWidget {
  final String text ;
  const DropDownText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp),
    );
  }
}