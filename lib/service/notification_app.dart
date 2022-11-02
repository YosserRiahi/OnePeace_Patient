import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotifcationApp {
  NotifcationApp._();

  //------initialise --------
  static void init() {
    AwesomeNotifications().initialize(
      'resource://drawable/res_splash',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            soundSource: "resource://raw/res_custom",
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color.fromARGB(255, 219, 175, 255),
            channelShowBadge: true,
            ledColor: Colors.white),
        NotificationChannel(
          channelKey: "scheduled_channel",
          channelName: 'Scheduled Notifications',
          defaultColor: Colors.deepPurple.shade100,
          channelShowBadge: true,
          channelDescription: "channel for schedul time",
          importance: NotificationImportance.High,
          locked: true,
        )
      ],
    );
  }

//----------- create notfication --------------//

  static Future<bool> createNotification(
      int id, String title, String body) async {
    return await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: title,
          body: body,
          backgroundColor: Colors.white,
          bigPicture: "asset://assets/logo/107901-meditation.gif",
          notificationLayout: NotificationLayout.BigPicture,
        ),
        actionButtons: [
          NotificationActionButton(
              key: "action",
              label: "Done",
              enabled: true,
              color: Colors.white,
              actionType: ActionType.KeepOnTop),
          NotificationActionButton(
              key: "remove",
              label: "remove",
              enabled: true,
              color: Colors.white,
              actionType: ActionType.DismissAction)
        ]);
  }

  // ----------------- schedule notification ------------//
  static Future<bool> createscheduleNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
  }) async {
    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: "scheduled_channel",
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
            key: "act",
            label: "Done",
            enabled: true,
            color: Colors.white,
            actionType: ActionType.Default),
      ],
      schedule: NotificationCalendar(
          hour: hour,
          repeats: true,
          preciseAlarm: true,
          minute: 0,
          second: 0,
          millisecond: 0),
    );
  }

  static Future<bool> createscheduleNotificationpractise(
      {required int id,
      required String title,
      required String body,
      required int minute,
      required int second}) async {
    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: "scheduled_channel",
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: "act",
          label: "Done",
          enabled: true,
          color: Colors.white,
        ),
      ],
      schedule: NotificationCalendar(
          hour: DateTime.now().hour,
          repeats: true,
          preciseAlarm: true,
          minute: minute,
          second: second,
          millisecond: 0),
    );
  }

  //---------- check permission -------------//
  static Future<bool> checkpermession() {
    return AwesomeNotifications().isNotificationAllowed();
  }

  //--------- request permession ------------//
  static void requestpermission() {
    checkpermession().then(
      (value) {
        if (!value) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  Future<bool> requestAlarm() async {
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  //------------ streamaction -----------------//

  // --------------- delete badge -----------//
  static void decrementbadge() {
    if (Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then((value) {
        // ignore: avoid_print
        print("value of badget $value");
        AwesomeNotifications().setGlobalBadgeCounter(1);
      });
    }
  }
}
