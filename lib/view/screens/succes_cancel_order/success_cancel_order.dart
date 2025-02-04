import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/core_widgets/auth_text.dart';
import '../../../core/functions/pop_func.dart';
import '../../core_widgets/bottom_app_bar.dart';
import '../../core_widgets/pop_widget.dart';

class SuccessCancelOrder extends StatelessWidget {
  const SuccessCancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(
              didpop,
              Get.offAllNamed(AppRoutesNames.ordersScreen,
                  arguments: {"index": 3}));
        },
        widget: Scaffold(
          bottomNavigationBar: CustomBottomAppBar(
            initIndex: 4,
          ),
          backgroundColor: AppColors.yellowBase,
          appBar: AppBar(
            backgroundColor: AppColors.yellowBase,
          ),
          body: SafeArea(
              child: Center(
            child: Column(
              spacing: 80,
              children: [
                Column(
                  children: [
                    Image.asset(AppImages.cancel,
                        width: ScreenSize.screenWidth * 0.5),
                    AuthText(
                      text: "¡Order Cancelled!",
                      textColor: AppColors.brown,
                      size: 24.sp,
                    ),
                    AuthText(
                      text: "Your order has been successfully cancelled",
                      textColor: AppColors.brown,
                      size: 18.sp,
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenHeight * 0.07),
                AuthText(
                  text:
                      "If you have any question reach directly to our customer support",
                  textColor: AppColors.brown,
                  size: 16.sp,
                ),
              ],
            ),
          )),
        ));
  }
}