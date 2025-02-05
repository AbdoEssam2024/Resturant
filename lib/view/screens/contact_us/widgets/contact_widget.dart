import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';

class ContactWidget extends StatelessWidget {
  final String image;
  final String label;

  final List<DropdownMenuEntry> dropDownWidgets;

  const ContactWidget(
      {super.key,
      required this.image,
      required this.dropDownWidgets,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.03),
      child: DropdownMenu(
        width: ScreenSize.screenWidth * 0.9,
        leadingIcon: Container(
            margin: EdgeInsets.only(right: ScreenSize.screenWidth * 0.08),
            width: ScreenSize.screenWidth * 0.1,
            // color: Colors.red,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            )),
        label: Text(label,
            style: TextStyle(
                color: AppColors.brown,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold)),
        trailingIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 30.sp,
          color: AppColors.orange,
        ),
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
        onSelected: (value) {},
        dropdownMenuEntries: dropDownWidgets,
      ),
    );
  }
}