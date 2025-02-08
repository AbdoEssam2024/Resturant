import 'package:get/get.dart';
import 'package:resturant_anj/model/settings_model/notification_settings_model.dart';

List<NotificationSettingsModel> notificatoinData = [
  NotificationSettingsModel(text: "Notification Settings", value: true.obs),
  NotificationSettingsModel(text: "Sound" , value: true.obs),
  NotificationSettingsModel(text: "Sound Call" , value: true.obs),
  NotificationSettingsModel(text: "Vibrate" , value: false.obs),
  NotificationSettingsModel(text: "Special Offers" , value: false.obs),
  NotificationSettingsModel(text: "Payment" , value: false.obs),
  NotificationSettingsModel(text: "Promo & Discount" , value: false.obs),
  NotificationSettingsModel(text: "CashBack" , value: false.obs),
];