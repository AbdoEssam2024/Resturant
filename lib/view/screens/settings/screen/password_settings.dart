import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/settings_controller/password_settings_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/auth_btn.dart';
import 'package:resturant_anj/view/core_widgets/custom_form_field.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';

class PasswordSettings extends GetView<PasswordSettingsController> {
  const PasswordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordSettingsController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, Get.offNamed(AppRoutesNames.settings));
        },
        widget: Scaffold(
            backgroundColor: AppColors.yellowBase,
            appBar: AppBar(
              backgroundColor: AppColors.yellowBase,
              toolbarHeight: ScreenSize.screenHeight * 0.1,
              leading: IconButton(
                  onPressed: () {
                    Get.offNamed(AppRoutesNames.settings);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              title: Text(
                "Password Settings",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              height: ScreenSize.screenHeight * 0.9,
              padding: EdgeInsets.symmetric(
                  vertical: ScreenSize.screenHeight * 0.2,
                  horizontal: ScreenSize.screenWidth * 0.05),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.sp))),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    GetBuilder<PasswordSettingsController>(
                        builder: (cotntroller) => HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: Column(
                                spacing: ScreenSize.screenHeight * 0.05,
                                children: [
                                  CostumFormField(
                                    feildController: controller.pass,
                                    iconFunc: () {
                                      controller.showPassword();
                                    },
                                    validFunc: (value) {
                                      return validInput(value!, 6, 20,
                                          "password", "Password");
                                    },
                                    secure: cotntroller.showPass,
                                    labelText: "New Password",
                                    sufIcon: cotntroller.showPass
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined,
                                  ),
                                  CostumFormField(
                                    iconFunc: () {
                                      controller.showPassword();
                                    },
                                    feildController: controller.confirmPass,
                                    validFunc: (value) {
                                      return validInput(value!, 6, 20,
                                          "password", "Password");
                                    },
                                    secure: cotntroller.showPass,
                                    labelText: "Confirm New Password",
                                    sufIcon: cotntroller.showPass
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined,
                                  ),
                                ],
                              ),
                            )),
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth * 0.15),
                      child: AuthButton(
                          btnColor: AppColors.orange,
                          text: "Change Password",
                          btnFunc: () {
                            controller.resetPass();
                          },
                          textColor: AppColors.white),
                    ),
                  ],
                ),
              ),
            )));
  }
}
