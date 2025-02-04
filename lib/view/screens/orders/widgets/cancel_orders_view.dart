import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import 'package:resturant_anj/model/orders/orders_model.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import 'order_btn.dart';

class CancelOrdersView extends GetView<OrdersController> {
  final Widget btnTwoWidget;

  const CancelOrdersView({
    super.key,
    required this.btnTwoWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.cancelOrders.length,
        itemBuilder: (context, index) => ActiveOrders(
              btnTwoWidget: btnTwoWidget,
              ordersModel: OrdersModel.fromJson(controller.cancelOrders[index]),
            )));
  }
}

class ActiveOrders extends GetView<OrdersController> {
  final Widget btnTwoWidget;
  final OrdersModel ordersModel;

  const ActiveOrders({
    super.key,
    required this.ordersModel,
    required this.btnTwoWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToOrderItemsView(
            ordersModel.orderId!, ordersModel.orderStatus!);
      },
      child: Card(
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
                        Text("Order Id : ${ordersModel.orderId!}"),
                        Text("Status : ${ordersModel.orderStatus}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${ordersModel.orderTime}"),
                        Text("${ordersModel.orderTotal} \$")
                      ],
                    ),
                    Row(
                      spacing: ScreenSize.screenWidth * 0.01,
                      children: [
                        Icon(
                          Icons.cancel,
                          color: AppColors.red,
                        ),
                        Text("Order Canceled"),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderBtn(
                              btnFunc: () {
                                controller.goToCheckOutScreen(
                                    orderId: ordersModel.orderId!);
                              },
                              text: "Order Again"),
                          btnTwoWidget
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}