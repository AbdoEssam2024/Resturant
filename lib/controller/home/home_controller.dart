import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/data/remote_data_home/offers_data.dart';
import 'package:resturant_anj/data/remote_data_home/recommend_data.dart';
import 'package:resturant_anj/main.dart';
import '../../core/functions/handling_request.dart';
import '../../data/remote_data_home/best_seller_data.dart';
import '../../data/remote_data_home/categories.dart';

class HomeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<ScaffoldState> scaffoldKey;

  int pageIndex = 2 ;
  late String userName;
  late String userEmail;
  int currentPage = 0;

  CategoriesData categoriesData = CategoriesData(Get.find());
  List categories = [];

  BestSellerData bestSellerData = BestSellerData(Get.find());
  List bestSeller = [];

  OffersData offersData = OffersData(Get.find());
  List offers = [];
  late PageController pageController;

  RecommendData recommendData = RecommendData(Get.find());
  List recommended = [];

  onChange(int index) {
    currentPage = index;
    update();
  }


  goToNextPage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  getName() {
    if (sharedPreferences.getString("name") == null) {
      userName = "";
    } else {
      userName = sharedPreferences.getString("name")!;
    }
    if (sharedPreferences.getString("email") == null) {
      userEmail = "";
    } else {
      userEmail = sharedPreferences.getString("email")!;
    }
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getCatigoriesData();
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        categories.addAll(response['data']);
      }
    }
    update();
  }

  getBestSellerItems() async {
    statusRequest = StatusRequest.loading;
    var response = await bestSellerData.getBestSellerData();
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        bestSeller.addAll(response['data']);
      }
    }
    update();
  }

  getOffersItems() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getOffersData();
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        offers.addAll(response['data']);
      }
    }
    update();
  }

  getRecommendedItems() async {
    statusRequest = StatusRequest.loading;
    var response = await recommendData.getRecommendData();
    statusRequest = handlingData(response);

    if (response['status'] == 'success') {
      if (statusRequest == StatusRequest.success) {
        recommended.addAll(response['data']);
      }
    }

    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    getName();
    getCategories();
    getBestSellerItems();
    getOffersItems();
    getRecommendedItems();
    scaffoldKey = GlobalKey<ScaffoldState>();

    super.onInit();
  }
}