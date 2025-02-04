import 'package:get/get.dart';

validInput(String val, int min, int max, String type, String feildName) {

  if (val.isEmpty) {
    return "Please Enter Your $feildName";
  }
  if (val.length < min) {
    return "${"$feildName Cannot Be Less Than"} $min";
  }

  if (val.length > max) {
    return "${'$feildName Cannot Be More Than'} $max";
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Please Enter Valid $feildName";
    }
  }
}