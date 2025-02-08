import 'package:get/get.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/functions/handling_request.dart';
import 'package:resturant_anj/data/remote_data/auth/user_data/delete_user_address.dart';
import 'package:resturant_anj/data/remote_data/auth/user_data/get_user_address.dart';
import 'package:resturant_anj/main.dart';
import '../../core/constant/routes/app_routes_names.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  GetUserAddress getUserAddress = GetUserAddress(Get.find());
  List userAddress = [];

  DeleteUserAddress deleteUserAddress = DeleteUserAddress(Get.find());

  late int userId;

  getUserAddressData() async {
    userAddress = [];
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

  deleteUserAddressData(int index) async {
    statusRequest = StatusRequest.loading;
    var response = await deleteUserAddress
        .deleteUserAddress(userAddress[index]['address_id']);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      if (statusRequest == StatusRequest.success) {
        Get.snackbar(response['status'], response['message']);
        getUserAddressData();
      }
    } else {
      Get.snackbar(response['status'], response['message']);
    }
  }



  goToAddAddressScreen() {
    Get.offNamed(AppRoutesNames.addAddressScreen,
        arguments: {"address": userAddress});
  }

  goToEditAddressScreen(int index) {
    Get.offNamed(AppRoutesNames.editAddressScreen, arguments: {
      "addressId" : userAddress[index]['address_id'],
      "title": userAddress[index]['address_title'],
      "address": userAddress[index]['address'],
    });
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