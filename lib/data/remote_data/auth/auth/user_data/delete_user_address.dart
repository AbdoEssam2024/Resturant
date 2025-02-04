import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/user_data/user_data_links.dart';

class DeleteUserAddress {
  Crud crud;

  DeleteUserAddress(this.crud);

  deleteUserAddress(int addressId) async {
    var response = crud.postData(UserDataLinks.deleteUserAddress, {
      "addressId": addressId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}