import 'package:get/get.dart';

class CoreController extends GetxController {
  String? groupVal;

  getValue(String value) {
    groupVal = value;
    update();
  }
}