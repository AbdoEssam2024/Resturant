import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/auth_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  resetPasswordFunc(String userEmail, String userPassword) async {
    var response = crud.postData(
        AuthApi.resetPassword, {"useremail": userEmail, "userpassword": userPassword});
    return response.fold((l) => l, (r) => r);
  }
}
