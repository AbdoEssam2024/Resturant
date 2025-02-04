import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/user_profile_controller/user_profile_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/profile/widgets/update_profile_btn.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../core/functions/inputs_func.dart';
import '../widgets/user_profile_inputs.dart';

class MyProfileScreen extends GetView<UserProfileController> {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserProfileController());
    return PopScopeWidget(
      func: (didpop, result) {
        popFunc(didpop, Get.offNamed(AppRoutesNames.homeScreen));
      },
      widget: Scaffold(
        backgroundColor: AppColors.yellowBase,
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenHeight * 0.1,
          leading: IconButton(
              onPressed: () {
                controller.backToHomePage();
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: AppColors.yellowBase,
          centerTitle: true,
          title: Text("My Profile"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.sp))),
            child: GetBuilder<UserProfileController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: ScreenSize.screenHeight * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenSize.screenWidth * 0.03,
                                  vertical: ScreenSize.screenHeight * 0.002),
                              width: ScreenSize.screenWidth * 0.4,
                              height: ScreenSize.screenHeight * 0.3,
                              child: Image.asset(
                                AppImages.userImage,
                                fit: BoxFit.contain,
                              )),
                          UserProfileInputs(
                              feildController: controller.name,
                              validFunc: (val) {
                                return validInput(val!, 6, 50, "name", "Name");
                              },
                              label: "Full Name"),
                          UserProfileInputs(
                              feildController: controller.email,
                              validFunc: (val) {
                                return validInput(
                                    val!, 6, 50, "email", "Email");
                              },
                              label: "Email"),
                          UserProfileInputs(
                              feildController: controller.phone,
                              validFunc: (val) {
                                return validInput(
                                    val!, 10, 14, "phone", "Phone");
                              },
                              label: "Phone"),
                          UserProfileInputs(
                              fieldTapFunc: () {
                                controller.selectDate(context);
                              },
                              icon: Icons.date_range_rounded,
                              readOnly: true,
                              feildController: controller.birthDate,
                              validFunc: (val) {
                                print("value :=> $val");
                                return "Date valid";
                              },
                              label: "Date Of Birth"),
                          UpdateProfileBtn(
                            btnText: "Update Profile",
                            btnFunc: () {
                              controller.updateUserDataFunc();
                            },
                          ),
                        ],
                      ),
                    ))),
      ),
    );
  }
}