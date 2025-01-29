import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/home/widgets/custom_drawer.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../widgets/best_seller_view.dart';
import '../../../core_widgets/bottom_app_bar.dart';
import '../widgets/categories_main_view.dart';
import '../widgets/home_appbar.dart';
import '../widgets/offers_view.dart';
import '../widgets/recommend_section.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(
              didpop,
              AwesomeDialog(
                title: "Exit",
                body: Text("Are You Sure Leaving App"),
                btnOkText: "Stay",
                btnOkOnPress: () {
                  Get.back();
                },
                btnCancelText: "Close App",
                btnCancelOnPress: () {
                  SystemNavigator.pop();
                },
                context: context,
              ).show());
        },
        widget: Scaffold(
          key: controller.scaffoldKey,
          endDrawer: CustomDrawer(),
          backgroundColor: AppColors.yellowBase,
          bottomNavigationBar: CustomBottomAppBar(
            initIndex: controller.pageIndex,
          ),
          body: SafeArea(
              child: GetBuilder<HomeController>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(children: <Widget>[
                        HomeAppbar(),
                        CategoriesStructure(),
                        BestSellerView(),
                        OffersMainView(),
                        RecommendSection(),
                      ])))),
        ));
  }
}