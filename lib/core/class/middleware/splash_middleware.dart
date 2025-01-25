import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/main.dart';

class SplashMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.getInt("visit") == 1) {
      return RouteSettings(name: AppRoutesNames.loginScreen);
    }
    if (sharedPreferences.getInt("visit") == 2) {
      return RouteSettings(name: AppRoutesNames.homeScreen);
    }
    return super.redirect(route);
  }
}
