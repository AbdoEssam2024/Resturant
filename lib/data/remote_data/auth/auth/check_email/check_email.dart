import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  checkUserEmail(String userEmail) async {
    var response = crud.postData(AuthApi.checkEmail, {
      "useremail": userEmail
    });
    return response.fold((l) => l, (r) => r);
  }
}