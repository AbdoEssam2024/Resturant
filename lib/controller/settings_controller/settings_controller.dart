import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';

class SettingsController extends GetxController {



  settingsNavigation(int index) {
    switch (index) {
      case 0:
        Get.offNamed(AppRoutesNames.notificationsettings);
        break;
      case 1:
        Get.offNamed(AppRoutesNames.passwordSettings);
        break;
      case 2:
        print("Taped $index");
        break;
    }
  }

}
