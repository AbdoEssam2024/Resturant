import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';

class AppbarIcons extends StatelessWidget {
  final IconData icon ;
  final void Function() func ;
  const AppbarIcons({super.key, required this.icon, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: IconButton(
            onPressed: func,
            icon: Icon(
              color: AppColors.orange,
              icon,
              size: 30,
            )));
  }
}