import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/data/const_data/splash_data/splash_data.dart';
import 'package:resturant_anj/main.dart';

class SplashController extends GetxController {

  late PageController pageController;
  int currentPage = 0;

  onChangePage(int val) {
    currentPage = val;
    update();
  }

  goToNextPage() {
    currentPage++;
    if (currentPage > splash.length - 1) {
      goToLogin();
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  goToLogin() {
    sharedPreferences.setInt("visit", 1);
    Get.offNamed(AppRoutesNames.loginScreen);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
