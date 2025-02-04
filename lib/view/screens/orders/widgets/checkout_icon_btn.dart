import 'package:flutter/material.dart';

class CheckoutIconBtn extends StatelessWidget {
  final void Function() iconFunc;

  final IconData icon;

  final Color iconColor;

  final double iconSize;

  const CheckoutIconBtn(
      {super.key,
      required this.iconFunc,
      required this.iconColor,
      required this.iconSize,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: iconFunc,
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}