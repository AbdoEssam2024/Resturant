import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import '../widgets/best_seller_view.dart';
import '../widgets/categories_main_view.dart';
import '../widgets/home_appbar.dart';

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
          backgroundColor: AppColors.yellowBase,
          body: SafeArea(
              child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: <Widget>[
                HomeAppbar(),
                CategoriesStructure(),
                BestSellerView(),
              ],
            ),
          ))),
    );
  }
}