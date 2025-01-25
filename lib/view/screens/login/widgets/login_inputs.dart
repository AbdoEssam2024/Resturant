import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/login/login_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import 'package:resturant_anj/view/core_widgets/custom_form_field.dart';

class LoginInputs extends GetView<LoginController> {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: controller.loginFormKey,
          child: Column(
            spacing: 15,
            children: [
              CostumFormField(
                  secure: false,
                  validFunc: (val) {
                    return validInput(val!, 6, 100, "email", "Email");
                  },
                  feildController: controller.email,
                  labelText: "Email"),
              GetBuilder<LoginController>(
                  builder: (controller) => CostumFormField(
                      secure: controller.showPass,
                      validFunc: (val) {
                        return validInput(val!, 6, 50, "password", "Password");
                      },
                      feildController: controller.password,
                      iconFunc: () {
                        controller.showPassword();
                      },
                      sufIcon: controller.showPass
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      labelText: "Password")),
            ],
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                controller.goToForgetPassword();
              },
              child: AuthText(
                text: "Forget Password",
                textColor: AppColors.orange,
                size: 16,
              ),
            )),
      ],
    );
  }
}