import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import 'package:resturant_anj/model/orders/orders_model.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';

class ActiveOrdersView extends GetView<OrdersController> {
  final List ordersModel;
  final int count ;

  const ActiveOrdersView({super.key, required this.ordersModel , required this.count});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) => OrdersItem(
              ordersModel: OrdersModel.fromJson(ordersModel[index]),
            ));
  }
}

class OrdersItem extends StatelessWidget {
  final OrdersModel ordersModel;

  const OrdersItem({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.02,
          vertical: ScreenSize.screenHeight * 0.008),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: AppColors.orangeTwo,
      elevation: 20,
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
                ordersModel.offersImage!,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.05),
              child: Column(
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
                      Text("29 Nov , 01:20"),
                      Text("${ordersModel.quantity} Items")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: AppColors.orange,
                        textColor: AppColors.white,
                        child: Text("Cancel Order"),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: AppColors.orange,
                        textColor: AppColors.white,
                        child: Text("Track Order"),
                      ),
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