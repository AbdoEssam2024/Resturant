import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth_api.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  verifyCode(String userEmail , String verifyCode) async {
    var response = crud.postData(AuthApi.verifyCode, {

      "email": userEmail,
      "verifycode": verifyCode
    });
    return response.fold((l) => l, (r) => r);
  }
}