import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';

ThemeData englishTheme = ThemeData(
    fontFamily: "PlayfairDisplay",
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.black),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.black),
      bodyMedium: TextStyle(
          height: 2,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ));

    ThemeData arabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.black),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.black),
      bodyMedium: TextStyle(
          height: 2,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ));