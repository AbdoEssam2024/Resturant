import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/view/screens/orders/widgets/bottom_sheet_widget.dart';
import '../../../../controller/orders_controller/order_items_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/orders/order_items_model.dart';
import 'order_btn.dart';

class OrderItemsView extends GetView<OrderItemsController> {
  const OrderItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderItemsController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.orderItems.length,
                itemBuilder: (context, index) => OrdersItem(
                      ordersItemsModel: OrdersItemsModel.fromJson(
                          controller.orderItems[index]),
                    ))));
  }
}

class OrdersItem extends GetView<OrderItemsController> {
  final OrdersItemsModel ordersItemsModel;

  const OrdersItem({
    super.key,
    required this.ordersItemsModel,
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
                ordersItemsModel.itemImage!,
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
                      Text(ordersItemsModel.itemName!),
                      Text("${ordersItemsModel.itemPriceAft} \$")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${ordersItemsModel.orderTime}"),
                      Text("${ordersItemsModel.quantity} Items")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Status : ${ordersItemsModel.itemStatus}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderBtn(
                          btnFunc: () {
                            ordersItemsModel.orderStatus! == "active"
                                ? Get.bottomSheet(BottomSheet(
                                    backgroundColor: AppColors.orangeTwo,
                                    animationController:
                                        controller.animationController,
                                    showDragHandle: true,
                                    onClosing: () {},
                                    builder: (context) => BottomSheetWidget(
                                          func: () {
                                            controller.deleteItem(
                                              status: "cancel",
                                                orderItemId: ordersItemsModel
                                                    .orderItemsId!);
                                            Get.back();
                                          },
                                        )))
                                : print("Orderd");

                            // ?
                            // : print("Ordered");
                          },
                          text: ordersItemsModel.orderStatus! == "active"
                              ? "Delete Item"
                              : "Order Again"),
                      OrderBtn(btnFunc: () {}, text: "Leave Review"),
                      // btnTwoWidget
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