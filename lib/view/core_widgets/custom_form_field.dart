import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

class CostumFormField extends StatelessWidget {
  final IconData? sufIcon;
  final String labelText;
  final void Function()? iconFunc;
  final String? Function(String?)? validFunc;
  final TextEditingController feildController;
  final bool secure;

  const CostumFormField(
      {super.key,
      this.sufIcon,
      required this.labelText,
      this.iconFunc,
      this.validFunc,
      required this.feildController,
      required this.secure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      controller: feildController,
      validator: validFunc,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.05),
          fillColor: AppColors.yellowBase,
          filled: true,
          suffixIcon: IconButton(onPressed: iconFunc, icon: Icon(sufIcon)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          label: Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.001),
            child: Text(
              labelText,
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}