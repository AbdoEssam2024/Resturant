import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/orders_controller/order_items_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../widgets/order_items.dart';

class OrderItemsScreen extends GetView<OrderItemsController> {
  const OrderItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderItemsController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.backToOrdersPage();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: AppColors.yellowBase,
        title: Text("Items"),
      ),
      body: OrderItemsView(),
    );
  }
}