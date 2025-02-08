import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/data/const_data/home_data/notification_drawer_data.dart';
import '../../../../core/constant/colors/app_colors.dart';

class NotificationDrawer extends GetView<HomeController> {
  const NotificationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenSize.screenWidth * 0.85,
      backgroundColor: AppColors.orange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80.sp),
              bottomLeft: Radius.circular(80.sp))),
      child: Container(
        padding: EdgeInsets.only(
          top: ScreenSize.screenHeight * 0.05,
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    iconSize: 25.sp,
                    color: AppColors.red,
                    onPressed: () {
                      controller.scaffoldKey.currentState!.closeEndDrawer();
                    },
                    icon: Icon(Icons.close))),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.04,
              
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: ScreenSize.screenWidth * 0.1,
                children: [
                  Image.asset(AppImages.notifications, color: AppColors.white),
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              indent: ScreenSize.screenWidth * 0.05,
              endIndent: ScreenSize.screenWidth * 0.05,
            ),
            SizedBox(

              height: ScreenSize.screenHeight * 0.7,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.015),
                itemCount: notificationDrawerData.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          
                        },
                        child: Column(
                          spacing: ScreenSize.screenHeight * 0.01,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.screenWidth * 0.15,
                                  height: ScreenSize.screenHeight * 0.07,
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenSize.screenHeight * 0.005,
                                      horizontal:
                                          ScreenSize.screenWidth * 0.02),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          ScreenSize.screenWidth * 0.05),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      notificationDrawerData[index].image!),
                                ),
                                Flexible(
                                  child: Text(
                                    notificationDrawerData[index].title!,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              indent: ScreenSize.screenWidth * 0.05,
                              endIndent: ScreenSize.screenWidth * 0.05,
                            ),
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
