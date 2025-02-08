import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/orders_controller/orders_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/orders/widgets/order_btn.dart';
import 'package:resturant_anj/view/screens/orders/widgets/tabs_widget.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../core_widgets/bottom_app_bar.dart';
import '../widgets/active_orders_view.dart';
import '../widgets/cancel_orders_view.dart';
import '../widgets/complete_orders_view.dart';
import '../widgets/no_orders.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, Get.offNamed(AppRoutesNames.homeScreen));
        },
        widget: Scaffold(
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
                height: ScreenSize.screenHeight * 0.63,
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
                                          btnFunc: () {}, text: "Leave Review"),
                                    ),
                              controller.completeOrders.isEmpty
                                  ? NoOrders(
                                      text: "Completed",
                                    )
                                  : CompleteOrdersView(
                                      btnTwoWidget: OrderBtn(
                                          btnFunc: () {}, text: "Leave Review"),
                                    ),
                              controller.cancelOrders.isEmpty
                                  ? NoOrders(
                                      text: "Canceled",
                                    )
                                  : CancelOrdersView(
                                      btnTwoWidget: OrderBtn(
                                          btnFunc: () {}, text: "Leave Review"),
                                    )
                            ]))),
              )
            ]),
          ),
        ));
  }
}
