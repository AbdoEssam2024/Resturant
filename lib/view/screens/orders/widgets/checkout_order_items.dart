import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import '../../../../controller/orders_controller/checkout_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/orders/order_items_model.dart';
import 'checkout_icon_btn.dart';
import 'order_btn.dart';

class CheckOutOrderItemsView extends GetView<CheckOutController> {
  const CheckOutOrderItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrdersItemsModel ordersItemsModel = OrdersItemsModel();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.sp)),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          GetBuilder<CheckOutController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding:
                        EdgeInsets.only(top: ScreenSize.screenWidth * 0.03),
                    height: ScreenSize.screenHeight * 0.7,
                    child: ListView.builder(
                        itemCount: controller.orderItems.length,
                        itemBuilder: (context, index) => OrdersItem(
                              index: index,
                              ordersItemsModel: OrdersItemsModel.fromJson(
                                  controller.orderItems[index]),
                            )),
                  ))),
          GetBuilder<CheckOutController>(
              builder: (controller) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black , width: 2.sp)),
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.05,
                        vertical: ScreenSize.screenHeight * 0.005),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Cash : ${controller.totalOrderResult} \$",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.otpaccentDarkGreenColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Total Count : ${controller.totalOrderCount}",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.otpaccentDarkGreenColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          width: ScreenSize.screenWidth,
                          // color: Colors.red,
                          margin: EdgeInsets.only(
                              top: ScreenSize.screenHeight * 0.01),
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.screenWidth * 0.15),
                          child: OrderBtn(btnFunc: () {}, text: "Check Out"),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}

class OrdersItem extends GetView<CheckOutController> {
  final OrdersItemsModel ordersItemsModel;
  final int index;

  const OrdersItem({
    super.key,
    required this.ordersItemsModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.orange,
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
                      CheckoutIconBtn(
                        icon: Icons.remove_circle_outline,
                        iconColor: AppColors.orange,
                        iconSize: 25.sp,
                        iconFunc: () {
                          controller.decreaseItemCount(index, context);
                        },
                      ),
                      Text("${ordersItemsModel.quantity} Items"),
                      CheckoutIconBtn(
                        icon: Icons.add_circle_outlined,
                        iconColor: AppColors.otpaccentDarkGreenColor,
                        iconSize: 25.sp,
                        iconFunc: () {
                          controller.increaseItemCount(index);
                        },
                      )
                    ],
                  ),
                  GetBuilder<CheckOutController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Total : ${(ordersItemsModel.itemPriceAft! * ordersItemsModel.quantity!)}"),
                        CheckoutIconBtn(
                          icon: Icons.delete_forever_rounded,
                          iconColor: AppColors.red,
                          iconSize: 25.sp,
                          iconFunc: () {},
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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