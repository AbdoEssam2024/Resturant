import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';

class AuthButton extends StatelessWidget {
  final double? btnWidth;
  final String text;
  final void Function() btnFunc;
  final Color? btnColor;
  final Color textColor;

  const AuthButton(
      {super.key,
      this.btnWidth,
      required this.text,
      required this.btnFunc,
      this.btnColor,
      required this.textColor,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),),
          color: btnColor,
          padding:
              EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.015),
          textColor: AppColors.white,
          onPressed: btnFunc,
          child: AuthText(text: text, textColor: textColor, size: 20)),
    );
  }
}