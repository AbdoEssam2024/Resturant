import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/data/orders/orders_items_data.dart';

import '../../core/functions/handling_request.dart';

class CheckOutController extends GetxController {
  late int orderId;

  List orderItems = [];

  double totalOrderResult = 0.0;
  double totalOrderCount = 0.0;

  StatusRequest statusRequest = StatusRequest.none;

  OrdersItemsData ordersItemsData = OrdersItemsData(Get.find());

  increaseItemCount(int index) {
    orderItems[index]["quantity"]++;
    getOrderTotal();
    update();
  }

  decreaseItemCount(int index, BuildContext context) {
    if (orderItems[index]["quantity"] > 1) {
      orderItems[index]["quantity"]--;
      getOrderTotal();
    }
    update();
  }

  getOrdersItems() async {
    orderItems = [];
    statusRequest = StatusRequest.loading;
    var response = await ordersItemsData.getOrdersItems(orderId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        orderItems.addAll(response['data']);
        getOrderTotal();
      }
    }

    update();
  }

  getOrderTotal() {
    double totalOrder = 0.0;
    double totalCount = 0;
    for (int i = 0; i < orderItems.length; i++) {
      totalOrder += (orderItems[i]["item_price_aft"] * orderItems[i]["quantity"]);
      totalCount += orderItems[i]["quantity"];
    }
    totalOrderResult = totalOrder;
    totalOrderCount = totalCount;
    update();
  }

  @override
  void onInit() {
    orderId = Get.arguments['orderId'];
    getOrdersItems();
    debugPrint("Order_Id :=> $orderId");
    super.onInit();
  }
}