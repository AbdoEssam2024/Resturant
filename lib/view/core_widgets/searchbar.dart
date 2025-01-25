import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String) func;

  const CustomSearchBar({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.007),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: TextFormField(
            onChanged: func,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.002),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 14.sp),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: AppColors.red,
                  ),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                filled: true,
                fillColor: AppColors.offWhite),
          )),
        ],
      ),
    );
  }
}