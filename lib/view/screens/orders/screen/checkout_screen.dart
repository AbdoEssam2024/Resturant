import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/view/screens/orders/widgets/checkout_icon_btn.dart';
import '../../../../controller/orders_controller/checkout_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../widgets/checkout_order_items.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellowBase,
        toolbarHeight: ScreenSize.screenHeight * 0.1,
        leading: CheckoutIconBtn(
            iconFunc: () {
              Get.offNamed(AppRoutesNames.ordersScreen,
                  arguments: {"index": 3});
            },
            iconColor: AppColors.black,
            iconSize: 25.sp,
            icon: Icons.arrow_back_ios),
        title: Text("Check Out"),
      ),
      body: Container(
          color: AppColors.yellowBase, child: CheckOutOrderItemsView()),
    );
  }
}