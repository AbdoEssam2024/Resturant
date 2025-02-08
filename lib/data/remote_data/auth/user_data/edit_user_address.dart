import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/user_data/user_data_links.dart';

class EditUserAddressData {
  Crud crud;

  EditUserAddressData(this.crud);

  editUserAddress(int addressId, String address, String addressTitle,) async {
    var response = crud.postData(UserDataLinks.editUserAddress, {
      "addressId": addressId.toString(),
      "address": address,
      "addressTitle": addressTitle
    });
    return response.fold((l) => l, (r) => r);
  }
}