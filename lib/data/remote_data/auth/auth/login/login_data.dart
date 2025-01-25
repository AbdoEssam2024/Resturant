import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  enterUser(String userEmail, String userPassword) async {
    var response = crud.postData(
        AuthApi.login, {"useremail": userEmail, "userpassword": userPassword});
    return response.fold((l) => l, (r) => r);
  }
}
