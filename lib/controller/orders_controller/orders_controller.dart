import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/data/orders/active_orders_data.dart';
import 'package:resturant_anj/data/orders/cancel_orders_data.dart';
import 'package:resturant_anj/data/orders/change_orders_status.dart';
import 'package:resturant_anj/data/orders/complete_orders_data.dart';
import '../../core/constant/colors/app_colors.dart';
import '../../core/functions/handling_request.dart';
import '../../main.dart';

class OrdersController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late TabController tabController;
  late int pageIndex;
  late int userId;
  bool isSelected = false;
  Color radioColor = AppColors.black;
  StatusRequest statusRequest = StatusRequest.none;

  ActiveOrdersData activeOrdersData = ActiveOrdersData(Get.find());
  List activeOrders = [].obs;
  CompleteOrdersData completeOrdersData = CompleteOrdersData(Get.find());
  List completeOrders = [].obs;
  CancelOrdersData cancelOrdersData = CancelOrdersData(Get.find());
  List cancelOrders = [].obs;

  ChangeOrdersStatus changeOrdersStatus = ChangeOrdersStatus(Get.find());
  StatusRequest changeOrderStatusRequest = StatusRequest.none;
  String changeResult = "";

  backToHomePage() {
    Get.offNamed(AppRoutesNames.homeScreen);
  }

  goToCheckOutScreen({required int orderId}) {
    Get.offNamed(AppRoutesNames.checkOutScreen,
        arguments: {"orderId": orderId});
  }

  getUserData() {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
  }

  getActiveOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response = await activeOrdersData.getActiveOrdersData(userId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        activeOrders.addAll(response['data']);
      }
    }
    update();
  }

  getCompleteOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response = await completeOrdersData.getCompleteOrdersData(userId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        completeOrders.addAll(response['data']);
      }
    }
    update();
  }

  getCancelOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response = await cancelOrdersData.getCancelOrdersData(userId);
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        cancelOrders.addAll(response['data']);
      }
    }
    update();
  }

  cancelOrder({required String status, required int orderId}) async {
    changeOrderStatusRequest = StatusRequest.loading;
    var response = await changeOrdersStatus.changeOrdersStatus(status, orderId);
    changeOrderStatusRequest = handlingData(response);
    print("Res :=> $response");
    if (response['status'] == 'success') {
      if (changeOrderStatusRequest == StatusRequest.success) {
        changeResult = "Order Status Changed Successfully";
        Get.offAllNamed(AppRoutesNames.successCancelOrder);
      }
    } else {
      changeResult = "Order Status Changed Failed";
      Get.snackbar("${response['status']}", changeResult);
    }
    update();
  }

  repeatOrder({
    required String status,
    required int orderId,
  }) async {
    changeOrderStatusRequest = StatusRequest.loading;
    var response = await changeOrdersStatus.changeOrdersStatus(status, orderId);
    changeOrderStatusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (changeOrderStatusRequest == StatusRequest.success) {
        changeResult = response['message'];
        Get.snackbar("${response['status']}", changeResult);
      }
    }
    update();
  }

  goToOrderItemsView(int orderId, String orderStatus) {
    Get.offNamed(AppRoutesNames.orderItemsScreen,
        arguments: {"orderid": orderId, "orderStatus": orderStatus});
  }

  @override
  void onInit() {
    tabController = TabController(
        length: 3, vsync: this, animationDuration: Duration(milliseconds: 500));
    pageIndex = Get.arguments['index'];
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    getUserData();
    getActiveOrdersData();
    getCompleteOrdersData();
    getCancelOrdersData();
    super.onInit();
  }
}