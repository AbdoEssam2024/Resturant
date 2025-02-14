import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/data/const_data/sqflite_db.dart';
import 'package:resturant_anj/data/remote_data/home_data/offers_data.dart';
import 'package:resturant_anj/data/remote_data/home_data/recommend_data.dart';
import 'package:resturant_anj/main.dart';
import 'package:resturant_anj/view/screens/home/widgets/user_profile_drawer.dart';
import '../../core/functions/handling_request.dart';
import '../../data/remote_data/home_data/best_seller_data.dart';
import '../../data/remote_data/home_data/categories.dart';

class HomeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<ScaffoldState> scaffoldKey;
  SqfliteDB sqfliteDB = SqfliteDB();
  List<Map<String, dynamic>> userData = [];

  int pageIndex = 2;
  late int userId;
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

  var drawerData = Rx<Widget>(UserProfileDrawer());

  List<Map<String, dynamic>> notificationData = [];

  updateDrawerData(Widget newWidget) {
    scaffoldKey.currentState!.openEndDrawer();
    drawerData.value = newWidget;
  }

  onChange(int index) {
    currentPage = index;
    update();
  }

  goToNextPage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  getName() async {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
    userData =
        await sqfliteDB.getData(userId, "user_data", "user_id = $userId");
    userName = userData[0]['user_name'];
    userEmail = userData[0]['user_email'];
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

  logoutFunc() {
    sharedPreferences.clear();
    Get.offAllNamed(AppRoutesNames.loginScreen);
  }

  getNotificationData() async {
    notificationData = [];
    notificationData =
        await sqfliteDB.getData(userId, "notifications", "user_id = $userId");
  }

  deleteNotification(int notificationId, int index) async {
    await sqfliteDB.deleteData(
        table: "notifications", where: "notificaion_id = $notificationId");
    getNotificationData();
    update();
  }

  initControllers() {
    pageController = PageController();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void onInit() {
    initControllers();
    getName();
    getCategories();
    getBestSellerItems();
    getOffersItems();
    getRecommendedItems();
    getNotificationData();

    super.onInit();
  }
}
