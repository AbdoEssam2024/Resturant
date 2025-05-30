import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth/auth_api.dart';

class VerifyCodeForgetData {
  Crud crud;
  VerifyCodeForgetData(this.crud);

  verifyCode(String userEmail, String verifyCode) async {
    var response = crud.postData(AuthApi.verifyCodeforget,
        {"email": userEmail, "verifycode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }
}