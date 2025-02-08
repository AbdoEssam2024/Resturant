import 'package:get/get.dart';
import '../constant/routes/app_routes_names.dart';

bottomBarNavigate(int index) {
  switch (index) {
    case 0:
      print("Index $index");
      break;
    case 1:
      print("Index $index");
      break;
    case 2:
      Get.offNamed(AppRoutesNames.homeScreen, arguments: {"index": index});
      break;
    case 3:
      Get.offNamed(AppRoutesNames.ordersScreen, arguments: {"index": index});
      break;
    case 4:
      Get.offNamed(AppRoutesNames.contact, arguments: {"index": index});
      break;
  }
}
