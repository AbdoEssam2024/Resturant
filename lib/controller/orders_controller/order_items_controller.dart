import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/data/remote_data/orders_data/orders/delete_order_item.dart';

import '../../core/class/status_request/statusrequest.dart';
import '../../core/constant/colors/app_colors.dart';
import '../../core/constant/routes/app_routes_names.dart';
import '../../core/functions/handling_request.dart';
import '../../data/remote_data/orders_data/orders/change_orders_status.dart';
import '../../data/remote_data/orders_data/orders/orders_items_data.dart';

class OrderItemsController extends GetxController
    with GetTickerProviderStateMixin {
  StatusRequest statusRequest = StatusRequest.none;
  late AnimationController animationController;
  late int orderId;
  late String orderStatus;

  OrdersItemsData ordersItemsData = OrdersItemsData(Get.find());
  List orderItems = [];

  ChangeOrdersStatus changeOrdersStatus = ChangeOrdersStatus(Get.find());
  String changeResult = "";

  DeleteOrderItem deleteOrderItem = DeleteOrderItem(Get.find());

  getOrdersItems(int orderId, String status) async {
    orderItems = [];
    statusRequest = StatusRequest.loading;
    var response = await ordersItemsData.getOrdersItems(orderId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        orderItems.addAll(response['data']);
      }
    }
    if (orderItems.isEmpty) {
      cancelOrder(orderId: orderId, status: status);
    }
    update();
  }

  cancelOrder({required String status, required int orderId}) async {
    statusRequest = StatusRequest.loading;
    var response = await changeOrdersStatus.changeOrdersStatus(status, orderId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {

        changeResult = "Order Status Changed Successfully";
        // Get.snackbar("${response[0]['status']}", changeResult);
        getOrdersItems(orderId, status);
      }
    } else {
      changeResult = "Order Status Changed Failed";
      Get.snackbar("${response['status']}", changeResult);
    }
    update();
  }

  deleteItem({required int orderItemId, required String status}) async {
    statusRequest = StatusRequest.loading;
    var response = await deleteOrderItem.deleteOrderItem(orderItemId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        changeResult = "Order Status Changed Successfully";
        Get.snackbar(
            backgroundColor: AppColors.orange,
            colorText: AppColors.white,
            snackPosition: SnackPosition.TOP,
            "${response['status']}",
            changeResult);
        getOrdersItems(orderId, status);
      }
    } else {
      changeResult = "Order Status Changed Failed";
      Get.snackbar(
          backgroundColor: AppColors.orange,
          colorText: AppColors.white,
          snackPosition: SnackPosition.TOP,
          "${response['status']}",
          changeResult);
    }

    update();
  }

  repeatOrder({
    required String status,
    required int orderId,
  }) async {
    statusRequest = StatusRequest.loading;
    var response = await changeOrdersStatus.changeOrdersStatus(status, orderId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        changeResult = "Order Status Changed Successfully";
        Get.snackbar(
            backgroundColor: AppColors.orange,
            colorText: AppColors.white,
            snackPosition: SnackPosition.TOP,
            "${response['status']}",
            changeResult);
        getOrdersItems(orderId, status);
      }
    } else {
      changeResult = "Order Status Changed Failed";
      Get.snackbar(
          backgroundColor: AppColors.orange,
          colorText: AppColors.white,
          snackPosition: SnackPosition.TOP,
          "${response['status']}",
          changeResult);
    }
    update();
  }

  backToOrdersPage() {
    Get.offNamed(AppRoutesNames.ordersScreen , arguments: {
      "index" : 3
    });
  }

  @override
  void onInit() {
    orderId = Get.arguments["orderid"];
    orderStatus = Get.arguments['orderStatus'];
    getOrdersItems(orderId, orderStatus);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.onInit();
  }
}