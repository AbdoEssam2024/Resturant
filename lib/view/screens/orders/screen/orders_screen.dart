import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/view/screens/orders/widgets/order_btn.dart';
import 'package:resturant_anj/view/screens/orders/widgets/tabs_widget.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../core_widgets/bottom_app_bar.dart';
import '../widgets/no_orders.dart';
import '../widgets/orders_item.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        initIndex: controller.pageIndex,
      ),
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: ScreenSize.screenHeight * 0.1,
        leading: IconButton(
            onPressed: () {
              controller.backToHomePage();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: AppColors.yellowBase,
        centerTitle: true,
        title: Text("My Orders"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        child: ListView(children: [
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: ScreenSize.screenHeight * 0.03),
              height: ScreenSize.screenHeight * 0.05,
              child: GetBuilder<OrdersController>(
                  builder: (controller) => OrdersTabBar())),
          SizedBox(
            height: ScreenSize.screenHeight * 0.8,
            child: GetBuilder<OrdersController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: TabBarView(
                        controller: controller.tabController,
                        children: [
                          controller.activeOrders.isEmpty
                              ? NoOrders(
                                  text: "Active",
                                )
                              : ActiveOrdersView(
                                  btnTwoWidget: OrderBtn(
                                      btnFunc: () {}, text: "Track Order"),
                                  ordersModel: controller.activeOrders,
                                  count: controller.activeOrders.length,
                                  text: 'Order In Progress',
                                  icon: Icons.downloading_rounded,
                                  iconColor: AppColors.otpaccentDarkGreenColor,
                                  changeStatus: "cancel",
                                  btnText: "Cancel Order",
                                ),
                          controller.completeOrders.isEmpty
                              ? NoOrders(
                                  text: "Completed",
                                )
                              : ActiveOrdersView(
                                  btnText: "Order Again",
                                  iconColor: AppColors.orange,
                                  icon: Icons.gpp_good_rounded,
                                  text: "Order delivered",
                                  btnTwoWidget: OrderBtn(
                                      btnFunc: () {}, text: "Leave Review"),
                                  ordersModel: controller.completeOrders,
                                  count: controller.completeOrders.length,
                                  changeStatus: 'active',
                                ),
                          controller.cancelOrders.isEmpty
                              ? NoOrders(
                                  text: "Canceled",
                                )
                              : ActiveOrdersView(
                                  btnText: "Order Again",
                                  iconColor: AppColors.red,
                                  icon: Icons.cancel,
                                  text: "Order Canceled",
                                  changeStatus: "active",
                                  btnTwoWidget: OrderBtn(
                                      btnFunc: () {}, text: "Leave Review"),
                                  ordersModel: controller.cancelOrders,
                                  count: controller.cancelOrders.length,
                                ),
                        ]))),
          )
        ]),
      ),
    );
  }
}