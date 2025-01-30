import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import 'package:resturant_anj/model/orders/orders_model.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import 'bottom_sheet_widget.dart';
import 'order_btn.dart';

class ActiveOrdersView extends GetView<OrdersController> {
  final String changeStatus;
  final Widget btnTwoWidget;
  final List ordersModel;
  final int count;
  final String text;
  final String btnText;

  final IconData icon;

  final Color iconColor;

  const ActiveOrdersView({
    super.key,
    required this.ordersModel,
    required this.count,
    required this.changeStatus,
    required this.btnTwoWidget,
    required this.text,
    required this.btnText,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) => OrdersItem(
              btnText: btnText,
              iconColor: iconColor,
              icon: icon,
              text: text,
              changeStatus: changeStatus,
              btnTwoWidget: btnTwoWidget,
              ordersModel: OrdersModel.fromJson(ordersModel[index]),
            ));
  }
}

class OrdersItem extends GetView<OrdersController> {
  final String changeStatus;
  final Widget btnTwoWidget;
  final OrdersModel ordersModel;
  final String text;
  final String btnText;

  final IconData icon;

  final Color iconColor;

  const OrdersItem({
    super.key,
    required this.ordersModel,
    required this.changeStatus,
    required this.btnTwoWidget,
    required this.text,
    required this.btnText,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.02,
          vertical: ScreenSize.screenHeight * 0.01),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: AppColors.orangeTwo,
              width: ScreenSize.screenHeight * 0.004),
          borderRadius: BorderRadius.circular(25.sp)),
      color: AppColors.white,
      elevation: 10.sp,
      shadowColor: AppColors.orange,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth * 0.005),
            width: ScreenSize.screenWidth * 0.2,
            height: ScreenSize.screenHeight * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                fit: BoxFit.cover,
                ordersModel.itemImage!,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ordersModel.itemName!),
                      Text("${ordersModel.orderTotal} \$")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${ordersModel.orderTime}"),
                      Text("${ordersModel.quantity} Items")
                    ],
                  ),
                  Row(
                    spacing: ScreenSize.screenWidth * 0.01,
                    children: [
                      Icon(
                        icon,
                        color: iconColor,
                      ),
                      Text(text),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderBtn(
                          btnFunc: () {
                            Get.bottomSheet(BottomSheet(
                                backgroundColor: AppColors.orangeTwo,
                                animationController:
                                    controller.animationController,
                                showDragHandle: true,
                                onClosing: () {},
                                builder: (context) => BottomSheetWidget(
                                      status: changeStatus,
                                      orderId: ordersModel.orderId!,
                                    )));
                          },
                          text: btnText),
                      btnTwoWidget
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}