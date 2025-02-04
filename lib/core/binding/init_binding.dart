import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';

import '../../controller/core_controller/core_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(CoreController());
  }
}