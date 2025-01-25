import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/main.dart';
import '../../core/functions/handling_request.dart';
import '../../data/remote_data_home/best_seller_data.dart';
import '../../data/remote_data_home/categories.dart';

class HomeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  late String userName;
  int currentPage = 0;

  CategoriesData categoriesData = CategoriesData(Get.find());
  List categories = [];

  BestSellerData bestSellerData = BestSellerData(Get.find());
  List bestSeller = [];

  onChange(int index) {
    currentPage = index;
    update();
  }

  getName() {
    if (sharedPreferences.getString("name") == null) {
      userName = "";
    } else {
      userName = sharedPreferences.getString("name")!;
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
  }

  @override
  void onInit() {
    getName();
    getCategories();
    getBestSellerItems();
    super.onInit();
  }
}