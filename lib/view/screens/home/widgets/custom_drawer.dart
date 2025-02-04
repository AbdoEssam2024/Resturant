import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/user_drawer_function.dart';
import 'package:resturant_anj/data/const_data/home_data/drawer_data.dart';
import '../../../../core/constant/colors/app_colors.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenSize.screenWidth * 0.85,
      backgroundColor: AppColors.orange,
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
                  horizontal: ScreenSize.screenWidth * 0.04),
              child: Card(
                color: AppColors.orangeTwo,
                child: ListTile(
                  leading: Image.asset(AppImages.drawerUser),
                  title: Text(
                    controller.userName,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    controller.userEmail,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ...List.generate(
                drawerData.length,
                (index) => InkWell(
                      onTap: () {
                        userDrawerNavigation(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: ScreenSize.screenHeight * 0.003),
                        child: Column(
                          spacing: ScreenSize.screenHeight * 0.01,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.screenWidth * 0.1,
                                  height: ScreenSize.screenHeight * 0.05,
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
                                  child: Image.asset(drawerData[index].image!),
                                ),
                                Text(
                                  drawerData[index].title!,
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Divider(
                              indent: ScreenSize.screenWidth * 0.05,
                              endIndent: ScreenSize.screenWidth * 0.05,
                            ),
                          ],
                        ),
                      ),
                    )),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth * 0.03,
                    vertical: ScreenSize.screenHeight * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.screenHeight * 0.01,
                    horizontal: ScreenSize.screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: ScreenSize.screenWidth * 0.05,
                  children: [
                    Container(
                      width: ScreenSize.screenWidth * 0.1,
                      height: ScreenSize.screenHeight * 0.05,
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.screenHeight * 0.005,
                          horizontal: ScreenSize.screenWidth * 0.02),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(AppImages.logout),
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}