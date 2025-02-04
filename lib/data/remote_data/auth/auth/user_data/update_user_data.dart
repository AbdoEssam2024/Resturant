import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/user_data/user_data_links.dart';

class UpdateUserData {
  Crud crud;

  UpdateUserData(this.crud);

  updateUserData(int userId, String userName, String userEmail,
      String birthDate, String phone) async {
    var response = crud.postData(UserDataLinks.updateUserData, {
      "id": userId.toString(),
      "name": userName,
      "birthdate": birthDate,
      "email": userEmail,
      "phone": phone.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}