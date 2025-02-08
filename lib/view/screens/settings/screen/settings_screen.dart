import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/data/const_data/settings_data/settings_data.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/settings/widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, Get.offNamed(AppRoutesNames.homeScreen));
        },
        widget: Scaffold(
            backgroundColor: AppColors.yellowBase,
            appBar: AppBar(
              backgroundColor: AppColors.yellowBase,
              toolbarHeight: ScreenSize.screenHeight * 0.1,
              leading: IconButton(
                  onPressed: () {
                    Get.offNamed(AppRoutesNames.homeScreen);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              title: Text(
                "Settings",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
                height: ScreenSize.screenHeight * 0.9,
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.screenHeight * 0.07,
                    horizontal: ScreenSize.screenWidth * 0.05),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.sp))),
                child: Container(
                    height: ScreenSize.screenHeight * 0.9,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenSize.screenHeight * 0.07,
                        horizontal: ScreenSize.screenWidth * 0.05),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50.sp))),
                    child: ListView.builder(
                      
                      itemCount: settingsData.length,
                      itemBuilder: ((context, index) => SettingsCard(
                            index: index,
                          )),
                    )))));
  }
}
