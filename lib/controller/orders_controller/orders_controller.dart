import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/data/orders/active_orders_data.dart';
import 'package:resturant_anj/data/orders/cancel_orders_data.dart';
import 'package:resturant_anj/data/orders/complete_orders_data.dart';

import '../../core/functions/handling_request.dart';
import '../../main.dart';

class OrdersController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late int pageIndex ;
  late TabController tabController;

  ActiveOrdersData activeOrdersData = ActiveOrdersData(Get.find());
  StatusRequest activeStatusRequest = StatusRequest.none;

  List activeOrders = [];

  CompleteOrdersData completeOrdersData = CompleteOrdersData(Get.find());
  StatusRequest completeStatusRequest = StatusRequest.none;

  List completeOrders = [];

  CancelOrdersData cancelOrdersData = CancelOrdersData(Get.find());
  StatusRequest cancelStatusRequest = StatusRequest.none;

  List cancelOrders = [];

  late int userId;

  backToHomePage() {
    Get.offNamed(AppRoutesNames.homeScreen);
  }

  getUserData() {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
  }

  getActiveOrders() async {
    activeStatusRequest = StatusRequest.loading;
    var response = await activeOrdersData.getActiveOrdersData(userId);
    activeStatusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (activeStatusRequest == StatusRequest.success) {
        activeOrders.addAll(response['data']);
      }
    }
    update();
  }

  getCompleteOrders() async {
    completeStatusRequest = StatusRequest.loading;
    var response = await completeOrdersData.getCompleteOrdersData(userId);
    completeStatusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (completeStatusRequest == StatusRequest.success) {
        completeOrders.addAll(response['data']);
      }
    }

    update();
  }

  getCancelOrders() async {
    cancelStatusRequest = StatusRequest.loading;
    var response = await cancelOrdersData.getCancelOrdersData(userId);
    cancelStatusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (cancelStatusRequest == StatusRequest.success) {
        cancelOrders.addAll(response['data']);
      }
    }

    update();
  }

  @override
  void onInit() {
    tabController = TabController(
        length: 3, vsync: this, animationDuration: Duration(milliseconds: 500));
    pageIndex = Get.arguments['index'];
    getUserData();
    getActiveOrders();
    getCompleteOrders();
    getCancelOrders();
    super.onInit();
  }
}