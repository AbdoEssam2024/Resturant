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

  bool isSelected = false;
  Color radioColor = AppColors.black;

  late int pageIndex;

  late TabController tabController;

  ActiveOrdersData activeOrdersData = ActiveOrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List activeOrders = [];

  CompleteOrdersData completeOrdersData = CompleteOrdersData(Get.find());

  List completeOrders = [];

  CancelOrdersData cancelOrdersData = CancelOrdersData(Get.find());

  ChangeOrdersStatus changeOrdersStatus = ChangeOrdersStatus(Get.find());
  StatusRequest changeOrderStatusRequest = StatusRequest.none;
  String changeResult = "";

  List cancelOrders = [];

  late int userId;

  String? groupVal;

  getValue(String value) {
    groupVal = value;
    update();
  }

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

  getCompleteOrders() async {
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

  getCancelOrders() async {
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

  changeOrderStatus({required String status, required int orderId}) async {
    changeOrderStatusRequest = StatusRequest.loading;
    var response = await changeOrdersStatus.changeOrdersStatus(status, orderId);
    changeOrderStatusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (changeOrderStatusRequest == StatusRequest.success) {
        changeResult = response['message'];
        Get.offAllNamed(AppRoutesNames.successCancelOrder);
      }
    }
    update();
  }

  @override
  void onInit() {
    tabController = TabController(
        length: 3, vsync: this, animationDuration: Duration(milliseconds: 500));
    pageIndex = Get.arguments['index'];
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    getUserData();
    getActiveOrders();
    getCompleteOrders();
    getCancelOrders();
    super.onInit();
  }
}