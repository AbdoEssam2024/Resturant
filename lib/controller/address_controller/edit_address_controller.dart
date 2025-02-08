import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/status_request/statusrequest.dart';
import '../../core/functions/handling_request.dart';
import '../../data/remote_data/auth/user_data/edit_user_address.dart';

class EditAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late String initTitle;
  late String initAddress;
  late int addressId;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController address;
  late TextEditingController addressTitle;

  EditUserAddressData editUserAddressData = EditUserAddressData(Get.find());

  editUserAddress() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await editUserAddressData.editUserAddress(
          addressId, address.text, addressTitle.text);
      statusRequest = handlingData(response);
      if (response['status'] == "success") {
        if (statusRequest == StatusRequest.success) {
          Get.snackbar(response['status'], "Address Edited Successfully");
        }
      } else {
        Get.snackbar(response['status'],
            "You Don't Make Edits To Save");
      }
    }
  }

  initializeControllers() {
    addressTitle = TextEditingController();
    address = TextEditingController();
  }

  disposeControllers() {
    addressTitle.dispose();
    address.dispose();
  }

  getUserData() {
    addressId = Get.arguments['addressId'];
    addressTitle.text = initTitle = Get.arguments['title'];
    address.text = initAddress = Get.arguments['address'];
  }

  @override
  void onInit() {
    initializeControllers();
    getUserData();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}