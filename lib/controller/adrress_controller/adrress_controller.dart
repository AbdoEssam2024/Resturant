import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/auth/user_data/get_user_address.dart';
import 'package:resturant_anj/main.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  GetUserAddress getUserAddress = GetUserAddress(Get.find());
  List userAddress = [];

  late int userId;

  getUserAddressData() async {
    statusRequest = StatusRequest.loading;
    var response = await getUserAddress.getUserAddress(userId);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest == StatusRequest.success) {
        userAddress.addAll(response['data']);
      }
    }
    update();
  }

  getUserData() {
    if (sharedPreferences.getInt("id") == null) {
      userId = -1;
    } else {
      userId = sharedPreferences.getInt("id")!;
    }
  }

  @override
  void onInit() {
    getUserData();
    getUserAddressData();
    super.onInit();
  }
}