import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/user_data/user_data_links.dart';

class AddUserAddress {
  Crud crud;

  AddUserAddress(this.crud);

  addUserAddress(int userId, String title, String address) async {
    var response = crud.postData(UserDataLinks.addUserAddress, {
      "id": userId.toString(),
      "title": title,
      "address": address,
    });
    return response.fold((l) => l, (r) => r);
  }
}