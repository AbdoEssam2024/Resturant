import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';

userDrawerNavigation(int index) {
  switch (index) {
    case 0:
      Get.offNamed(AppRoutesNames.ordersScreen, arguments: {"index": 3});
      break;
    case 1:
      Get.offNamed(AppRoutesNames.myProfileScreen);
      break;
    case 2:
      Get.offNamed(AppRoutesNames.userAddressScreen);
      break;
    case 3:
      print("3");
      break;
    case 4:
      Get.offNamed(AppRoutesNames.contact);
      break;
    case 5:
      print("5");
      break;
    case 6:
      Get.offNamed(AppRoutesNames.settings);
      break;
  }
}
