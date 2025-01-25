import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/reset_password/reset_password_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/appbar_leading.dart';
import 'package:resturant_anj/view/core_widgets/auth_btn.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/core_widgets/custom_form_field.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';

class ResetPassword extends GetView<ResetPasswordController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, controller.backToVerifyForgetPass());
        },
        widget: Scaffold(
          backgroundColor: AppColors.yellowBase,
          appBar: AppBar(
            title: AuthText(
              text: "Reset Password",
              textColor: AppColors.grey,
              size: 40,
            ),
            centerTitle: true,
            toolbarHeight: ScreenSize.screenHeight * 0.15,
            backgroundColor: AppColors.yellowBase,
            leading: InkWell(
              onTap: () {
                controller.backToVerifyForgetPass();
              },
              child: AppBarLeading(),
            ),
          ),
          body: SafeArea(
              child: Container(
                height: ScreenSize.screenHeight,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50))
                ),
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.04 , vertical: ScreenSize.screenHeight * 0.05),
            width: ScreenSize.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                spacing: 50,
                children: [
                  Column(
                    children: [

                      AuthText(
                        text: "No Worries\n Regain Access With Your Email",
                        textColor: AppColors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                  GetBuilder<ResetPasswordController>(
                      builder: (controller) => Form(
                        key: controller.formKey,
                        child: Column(
                              spacing: 30,
                              children: [
                                CostumFormField(
                                    secure: controller.showPass,
                                    validFunc: (val) {
                                      return validInput(
                                          val!, 6, 50, "password", "Password");
                                    },
                                    feildController: controller.pass,
                                    iconFunc: () {
                                      controller.showPassword();
                                    },
                                    sufIcon: controller.showPass
                                        ? Icons.remove_red_eye_rounded
                                        : Icons.remove_red_eye_outlined,

                                    labelText: "Password"),
                                CostumFormField(
                                    secure: controller.showPass,
                                    validFunc: (val) {
                                      return validInput(val!, 6, 50, "password",
                                          "Confirm Password");
                                    },
                                    feildController: controller.confirmPass,
                                    iconFunc: () {
                                      controller.showPassword();
                                    },
                                    sufIcon: controller.showPass
                                        ? Icons.remove_red_eye_rounded
                                        : Icons.remove_red_eye_outlined,

                                    labelText: "Password"),
                              ],
                            ),
                      )),
                  AuthButton(
                      btnWidth: ScreenSize.screenWidth * 0.6,
                      btnColor: AppColors.red,
                      text: "Reset Password",
                      btnFunc: () {
                        controller.resetPass();
                      },
                      textColor: AppColors.white)
                ],
              ),
            ),
          )),
        ));
  }
}