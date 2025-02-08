import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth/auth_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  addUser(String userName, String userPassword, String userEmail) async {
    var response = crud.postData(AuthApi.signup, {
      "username": userName,
      "userpassword": userPassword,
      "useremail": userEmail
    });
    return response.fold((l) => l, (r) => r);
  }
}