import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/settings_controller/notification_settings_controller.dart';
import 'package:resturant_anj/core/constant/colors/app_colors.dart';
import 'package:resturant_anj/core/constant/screen_size/screen_size.dart';

class NotificationSettingsWidget
    extends GetView<NotificationSettingsController> {
  const NotificationSettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.013),
        child: Obx(() => Column(
              spacing: ScreenSize.screenHeight * 0.02,
              children: [
                NotificationSettingsItem(
                    text: "Notification Settings",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "general_settings",
                          val: value == true ? 1 : 0);
                    },
                    switchValue: controller
                                .notificationSettingsData["general_settings"] ==
                            0
                        ? false
                        : true),
                NotificationSettingsItem(
                    text: "Sound",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "sound", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["sound"] == 0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "Sound Call",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "sound_call", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["sound_call"] == 0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "Vibrate",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "vibrate", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["vibrate"] == 0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "Special Offers",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "special_offers",
                          val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["special_offers"] ==
                                0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "Payment",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "payment", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["payment"] == 0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "Promo & Discount",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "discount", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["discount"] == 0
                            ? false
                            : true),
                NotificationSettingsItem(
                    text: "CashBack",
                    switchFunc: (value) {
                      controller.switchFunc(
                          colName: "cashBack", val: value == true ? 1 : 0);
                    },
                    switchValue:
                        controller.notificationSettingsData["cashBack"] == 0
                            ? false
                            : true),
              ],
            )));
  }
}

class NotificationSettingsItem extends StatelessWidget {
  final String text;
  final void Function(bool) switchFunc;
  final bool switchValue;
  const NotificationSettingsItem(
      {super.key,
      required this.text,
      required this.switchFunc,
      required this.switchValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColors.brown,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        Switch(
          value: switchValue,
          activeColor: AppColors.white,
          activeTrackColor: AppColors.orange,
          onChanged: switchFunc,
        )
      ],
    );
  }
}
