import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/signup/signup_controller.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import 'package:resturant_anj/view/core_widgets/custom_form_field.dart';

class SignupInputs extends GetView<SignupController> {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        spacing: 15,
        children: [
          CostumFormField(
              secure: false,
              validFunc: (val) {
                return validInput(val!, 6, 20, "name", "Name");
              },
              feildController: controller.name,
              sufIcon: Icons.person_2,

              labelText: "Name"),
          CostumFormField(
              secure: false,
              validFunc: (val) {
                return validInput(val!, 6, 100, "email", "Email");
              },
              feildController: controller.email,
              sufIcon: Icons.alternate_email_rounded,

              labelText: "Email"),
          GetBuilder<SignupController>(
              builder: (controller) => CostumFormField(
                  secure: controller.showPass,
                  validFunc: (val) {
                    return validInput(val!, 6, 50, "password", "Password");
                  },
                  feildController: controller.password,
                  iconFunc: () {
                    controller.showPassWord();
                  },
                  sufIcon: controller.showPass
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,

                  labelText: "Password")),
        ],
      ),
    );
  }
}