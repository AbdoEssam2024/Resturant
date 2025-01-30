import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';

class OrderBtn extends StatelessWidget {
  final void Function() btnFunc;
  final String text;

  const OrderBtn({super.key, required this.btnFunc, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: btnFunc,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColors.orange,
      textColor: AppColors.orangeTwo,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}