import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';

List<TextStyle?> otpTextStyles = [
  createStyle(AppColors.otpaccentDarkGreenColor),
  createStyle(AppColors.otpaccentOrangeColor),
  createStyle(AppColors.otpaccentPinkColor),
  createStyle(AppColors.otpaccentPurpleColor),
  createStyle(AppColors.otpaccentYellowColor),
  createStyle(AppColors.otpprimaryColor),
];

TextStyle? createStyle(Color color) {
  ThemeData theme = Get.theme;
  return theme.textTheme.headlineLarge?.copyWith(color: color);
}
