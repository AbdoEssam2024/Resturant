import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/signup/signup_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/core_widgets/appbar_leading.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/signup/widgets/signup_actions.dart';
import 'package:resturant_anj/view/screens/signup/widgets/signup_inputs.dart';

class SignUp extends GetView<SignupController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, controller.goToLoginPage());
        },
        widget: Scaffold(
          backgroundColor: AppColors.yellowBase,
          appBar: AppBar(
            title: AuthText(
              text: "Create Account",
              textColor: AppColors.grey,
              size: 34,
            ),
            centerTitle: true,
            toolbarHeight: ScreenSize.screenHeight * 0.2,
            backgroundColor: AppColors.yellowBase,
            leading: AppBarLeading(),
          ),
          body: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SafeArea(
                  child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))),
                height: ScreenSize.screenHeight,
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth * 0.08,
                    vertical: ScreenSize.screenHeight * 0.09),
                width: ScreenSize.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 30,
                    children: [
                      SignupInputs(),
                      SignUpActions(),
                    ],
                  ),
                ),
              ))),
        ));
  }
}