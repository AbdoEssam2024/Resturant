import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/forget_password/forget_pass_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/appbar_leading.dart';
import 'package:resturant_anj/view/core_widgets/auth_btn.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/core_widgets/custom_form_field.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/forget_password/widgets/text_btn.dart';

class ForgetPassword extends GetView<ForgetPassController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, controller.backToLoginScreen());
        },
        widget: Scaffold(
          backgroundColor: AppColors.yellowBase,
          appBar: AppBar(
            title: AuthText(
              text: "Forget Your Password ?",
              textColor: AppColors.grey,
              size: 30,
            ),
            centerTitle: true,
            toolbarHeight: ScreenSize.screenHeight * 0.15,
            backgroundColor: AppColors.yellowBase,
            leading: InkWell(
              onTap: () {
                controller.backToLoginScreen();
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
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.05 , vertical: ScreenSize.screenHeight * 0.08),
            width: ScreenSize.screenWidth,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
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
                    CostumFormField(
                        secure: false,
                        validFunc: (val) {
                          return validInput(val!, 6, 100, "email", "Email");
                        },
                        feildController: controller.email,
                        sufIcon: Icons.alternate_email_rounded,
                        labelText: "Email"),
                    AuthButton(
                        btnWidth: ScreenSize.screenWidth * 0.6,
                        btnColor: AppColors.orange,
                        text: "Send Code",
                        btnFunc: () {
                          controller.checkEmail();
                        },
                        textColor: AppColors.white),
                    TextBtn(
                        actionText: "Resent",
                        nonActionText: "Don't Received The Code ?",
                        func: () {})
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}