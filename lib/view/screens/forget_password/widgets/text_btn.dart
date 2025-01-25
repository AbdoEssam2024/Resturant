import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';

class TextBtn extends StatelessWidget {
  final String actionText;
  final String nonActionText;
  final void Function() func;
  const TextBtn(
      {super.key,
      required this.actionText,
      required this.nonActionText,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthText(text: nonActionText, textColor: AppColors.black, size: 14),
        TextButton(
            onPressed: func,
            child:
                AuthText(text: actionText, textColor: AppColors.orange, size: 18))
      ],
    );
  }
}