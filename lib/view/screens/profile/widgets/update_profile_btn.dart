import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../core_widgets/auth_text.dart';

class UpdateProfileBtn extends StatelessWidget {
  final String btnText ;
  final void Function() btnFunc ;
  const UpdateProfileBtn({super.key, required this.btnText, required this.btnFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.1),
      margin: EdgeInsets.only(top: ScreenSize.screenHeight * 0.03),
      width: ScreenSize.screenWidth,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: AppColors.orange,
          padding:
              EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.015),
          textColor: AppColors.white,
          onPressed: btnFunc,
          child: AuthText(
              text: btnText, textColor: AppColors.white, size: 20)),
    );
  }
}