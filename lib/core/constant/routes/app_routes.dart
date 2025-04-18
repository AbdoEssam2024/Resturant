import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/class/middleware/splash_middleware.dart';
import 'package:resturant_anj/view/screens/forget_password/screen/forget_password.dart';
import 'package:resturant_anj/view/screens/home/screen/home_page.dart';
import 'package:resturant_anj/view/screens/login/screen/login_page.dart';
import 'package:resturant_anj/view/screens/reset_password/reset_password.dart';
import 'package:resturant_anj/view/screens/settings/screen/notification_settings.dart';
import 'package:resturant_anj/view/screens/settings/screen/password_settings.dart';
import 'package:resturant_anj/view/screens/settings/screen/settings_screen.dart';
import 'package:resturant_anj/view/screens/signup/screen/signup.dart';
import 'package:resturant_anj/view/screens/splash_screen/screen/splash_screen.dart';
import 'package:resturant_anj/view/screens/succes_reset_password/success_reset_pass.dart';
import 'package:resturant_anj/view/screens/succes_signup/success_signup.dart';
import 'package:resturant_anj/view/screens/verify_email_forgetPw/screen/verify_email_forgetpw.dart';
import 'package:resturant_anj/view/screens/verify_email_signup/screen/verify_email_signup.dart';
import '../../../view/screens/contact_us/screen/contact_us_screen.dart';
import '../../../view/screens/orders/screen/checkout_screen.dart';
import '../../../view/screens/orders/screen/order_items_screen.dart';
import '../../../view/screens/orders/screen/orders_screen.dart';
import '../../../view/screens/profile/screen/my_profile.dart';
import '../../../view/screens/succes_cancel_order/success_cancel_order.dart';
import '../../../view/screens/user_address/screen/add_address_screen.dart';
import '../../../view/screens/user_address/screen/edit_address_screen.dart';
import '../../../view/screens/user_address/screen/user_address_screen.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: AppRoutesNames.splashScreen,
      page: () => SplashScreen(),
      middlewares: [SplashMiddleware()]
      ),
  GetPage(name: AppRoutesNames.loginScreen, page: () => LoginPage()),
  GetPage(name: AppRoutesNames.signUpScreen, page: () => SignUp()),
  GetPage(
      name: AppRoutesNames.verifyEmailSignUp, page: () => VerifyEmailSignUp()),
  GetPage(name: AppRoutesNames.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoutesNames.forgetPassword, page: () => ForgetPassword()),
  GetPage(
      name: AppRoutesNames.verifyForgetPass,
      page: () => VerifyEmailForgetPass()),
  GetPage(name: AppRoutesNames.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoutesNames.successResetPassword,
      page: () => SuccessResetPass()),
  GetPage(name: AppRoutesNames.homeScreen, page: () => HomePage()),
  GetPage(name: AppRoutesNames.ordersScreen, page: () => OrdersScreen()),
  GetPage(
      name: AppRoutesNames.successCancelOrder,
      page: () => SuccessCancelOrder()),
  GetPage(
      name: AppRoutesNames.orderItemsScreen, page: () => OrderItemsScreen()),
  GetPage(name: AppRoutesNames.checkOutScreen, page: () => CheckOutScreen()),
  GetPage(name: AppRoutesNames.myProfileScreen, page: () => MyProfileScreen()),
  GetPage(
      name: AppRoutesNames.userAddressScreen, page: () => UserAddressScreen()),
  GetPage(
      name: AppRoutesNames.addAddressScreen, page: () => AddAddressScreen()),
  GetPage(
      name: AppRoutesNames.editAddressScreen, page: () => EditAddressScreen()),
  GetPage(name: AppRoutesNames.contact, page: () => ContactUsScreen()),
  GetPage(name: AppRoutesNames.settings, page: () => SettingsScreen()),
  GetPage(name: AppRoutesNames.notificationsettings, page: () => NotificationSettings()),
  GetPage(name: AppRoutesNames.passwordSettings, page: () => PasswordSettings()),
];