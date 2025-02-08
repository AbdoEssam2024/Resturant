import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/settings_controller/settings_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/data/const_data/settings_data/settings_data.dart';

class SettingsCard extends GetView<SettingsController> {
  final int index ;
  const SettingsCard({super.key , required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return InkWell(
      onTap: () {
        controller.settingsNavigation(index);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.03),
        color: AppColors.grey,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.03),
          height: ScreenSize.screenHeight * 0.1,
          child: Row(
            spacing: ScreenSize.screenWidth * 0.05,
            children: [
              SizedBox(
                width: ScreenSize.screenWidth * 0.07,
                child: Image.asset(settingsData[index].image , fit: BoxFit.cover,)),
              Text(
                settingsData[index].title,
                style: TextStyle(color: AppColors.white , fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
