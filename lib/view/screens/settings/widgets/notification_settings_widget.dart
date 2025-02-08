import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:resturant_anj/controller/settings_controller/settings_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

class NotificationSettingsWidget extends StatelessWidget {
  final String text;
  final bool switchValue;
  final void Function(bool) switchFunc;
  const NotificationSettingsWidget(
      {super.key,
      required this.text,
      required this.switchValue,
      required this.switchFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.013),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: AppColors.brown,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          Switch(
            value: switchValue,
            activeColor: AppColors.white,
            activeTrackColor: AppColors.orange,
            onChanged: switchFunc,
          )
        ],
      ),
    );
  }
}
