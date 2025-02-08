import 'package:get/get.dart';
import 'package:resturant_anj/core/class/notifications/notifications.dart';
import 'package:resturant_anj/data/const_data/sqflite_db.dart';
import 'package:resturant_anj/main.dart';

class NotificationSettingsController extends GetxController {
  SqfliteDB sqfliteDB = SqfliteDB();
  late int userId;
  RxMap<String, dynamic> notificationSettingsData = <String, dynamic>{}.obs;

  switchFunc({required String colName, required int val}) async {
    int response =
        await sqfliteDB.updateData("notification_settings", {colName: val});
    print("Update Response :=> $response");
    await getSettingsData();
    if (notificationSettingsData[colName] == 1) {
      Notifications.showWelcomeNotification();
    } else {
      Notifications.cancelAllNotifications();
    }
  }

  getUserData() {
    if (sharedPreferences.getInt("id") != null) {
      userId = sharedPreferences.getInt("id")!;
    } else {
      userId = -1;
    }
  }

  getSettingsData() async {
    List<Map<String, dynamic>> response = await sqfliteDB.getData(
        userId, "notification_settings", "user_id = $userId");
    notificationSettingsData.value = response[0];
    insertSettingsData();
    print("Res :=> $notificationSettingsData");
  }

  insertSettingsData() async {
    if (notificationSettingsData.isEmpty) {
      int response = await sqfliteDB.insertData(
        table: 'notification_settings',
        columns:
            "'user_id' , 'general_settings' , 'sound' , 'sound_call' , 'vibrate' , 'special_offers' , 'payment' , 'discount' , 'cashBack'",
        values: "$userId,1,0,1,0,0,1,1,0",
      );
      return response;
    }
    update();
  }

  delete() async {
    int response = await sqfliteDB.deleteData(
        "DELETE FROM 'notification_settings' WHERE user_id = $userId");
    print("Delete Response :=> $response");
  }

  @override
  void onInit() {
    getUserData();
    // delete();
    getSettingsData();
    super.onInit();
  }
}
