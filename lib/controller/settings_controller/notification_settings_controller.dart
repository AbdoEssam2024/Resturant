import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/notifications/notifications.dart';
import 'package:resturant_anj/data/const_data/settings_data/notification_data.dart';

class NotificationSettingsController extends GetxController {
  switchFunc(int index, bool val) {
    notificatoinData[index].value.value = val;
    switch (index) {
      case 0:
        if (notificatoinData[0].value.value) {
          print("Notification Enabled");
        } else {
          Notifications.cancelNotification();
        }
    }
  }
}
