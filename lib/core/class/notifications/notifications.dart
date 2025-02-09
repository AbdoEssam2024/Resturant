import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTapFunc(NotificationResponse notificationResponse) {}

  static Future initNotifications() async {
    InitializationSettings initSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onTapFunc,
      onDidReceiveBackgroundNotificationResponse: onTapFunc,
    );
  }

  static void showOnceNotification({required String title , required String body}) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails("1", "First Notification",
          importance: Importance.max, priority: Priority.high),
    );
    await flutterLocalNotificationsPlugin.show(
        0, title, body, details,
        payload: "Payload Data");
  }

  // static void showRepeatedNotification() async {
  //   NotificationDetails details = NotificationDetails(
  //     android: AndroidNotificationDetails("2", "Repeated Notification",
  //         importance: Importance.max, priority: Priority.high),
  //   );
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //       1,
  //       "Welcome",
  //       "Welcome To App Repeated",
  //       androidScheduleMode: AndroidScheduleMode.alarmClock,
  //       RepeatInterval.everyMinute,
  //       details,
  //       payload: "Payload Data");
  // }

  //   static void showScheduledNotification() async {
  //   NotificationDetails details = NotificationDetails(
  //     android: AndroidNotificationDetails("2", "Repeated Notification",
  //         importance: Importance.max, priority: Priority.high),
  //   );
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //       1,
  //       "Welcome",
  //       "Welcome To App Repeated",
  //       androidScheduleMode: AndroidScheduleMode.alarmClock,
  //       RepeatInterval.everyMinute,
  //       details,
  //       payload: "Payload Data");
  // }

  static void cancelSpicifiecNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    print("Canceled");
  }

  static void cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
