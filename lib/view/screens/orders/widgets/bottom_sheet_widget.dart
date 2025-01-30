import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';

class BottomSheetWidget extends GetView<OrdersController> {
  final String status;

  final int orderId;

  const BottomSheetWidget({
    super.key,
    required this.status,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.03),
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        child: GetBuilder<OrdersController>(
            builder: (controller) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: ScreenSize.screenHeight * 0.01),
                      child: Align(
                        child: BottomSheetText(
                            text:
                                "Please Before Canceling , Let Us Know The Reason \n Every Bit Of Feedback Helps !",
                            size: 12.sp),
                      ),
                    ),
                    RadioWidget(text: "Too Expensive", val: "reason1"),
                    RadioWidget(
                        text: "Switching To Another Product", val: "reason2"),
                    RadioWidget(
                        text: "Missing Features I Need", val: "reason3"),
                    RadioWidget(text: "Add Other Reason", val: "reason4"),
                    TextFormField(
                      enabled: controller.groupVal == "reason4" ? true : false,
                      decoration: InputDecoration(
                          fillColor: AppColors.yellowTwo,
                          filled: true,
                          border: OutlineInputBorder()),
                      selectionHeightStyle: BoxHeightStyle.max,
                      minLines: 1,
                      maxLines: 3,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: ScreenSize.screenHeight * 0.015),
                      child: MaterialButton(
                          color: AppColors.orange,
                          textColor: AppColors.orangeTwo,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.screenWidth * 0.1,
                              vertical: ScreenSize.screenHeight * 0.015),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            controller.changeOrderStatus(
                                status: status, orderId: orderId);
                          },
                          child: BottomSheetText(
                            text: "Submit",
                            size: 16.sp,
                          )),
                    )
                  ],
                )),
      ),
    );
  }
}

class RadioWidget extends GetView<OrdersController> {
  final String text;

  final String val;

  const RadioWidget({super.key, required this.text, required this.val});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BottomSheetText(
          text: text,
          size: 14.sp,
        ),
        Radio(
          value: val,
          groupValue: controller.groupVal,
          onChanged: (value) {
            controller.getValue(value!);
          },
        ),
      ],
    );
  }
}

class BottomSheetText extends StatelessWidget {
  final String text;

  final double size;

  const BottomSheetText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          color: AppColors.brown, fontSize: size, fontWeight: FontWeight.w600),
    );
  }
}