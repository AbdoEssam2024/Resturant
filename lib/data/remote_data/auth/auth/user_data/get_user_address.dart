import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/user_data/user_data_links.dart';

class GetUserAddress {
  Crud crud;

  GetUserAddress(this.crud);

  getUserAddress(int userId) async {
    var response = crud.postData(UserDataLinks.getUserAddress, {
      "id": userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}