import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

import '../../../../core/constant/colors/app_colors.dart';

class OrderBtn extends StatelessWidget {
  final void Function() btnFunc;
  final String text;

  const OrderBtn({super.key, required this.btnFunc, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: btnFunc,
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.screenHeight * 0.02,
          horizontal: ScreenSize.screenWidth * 0.025),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColors.orange,
      textColor: AppColors.orangeTwo,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}