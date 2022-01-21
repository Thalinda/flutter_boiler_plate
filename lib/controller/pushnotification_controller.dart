import 'dart:io';

import 'package:boiler_plate/constants/colors.dart';
import 'package:boiler_plate/ui/home/home.dart';
import 'package:boiler_plate/utils/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';




class FCMController {
  //
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title

    importance: Importance.high,
    enableVibration: true,
    playSound: true,
  );

  //
  createAndroidChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
  //
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  //
  static bool gotNewNotification = false;



  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late String token;
  GlobalFunctions gf = GlobalFunctions();
  String accessToken = "";

  stop() {
    messaging.unsubscribeFromTopic("all");
  }

  start() {
    if (accessToken != null && accessToken.length > 1)
      messaging.subscribeToTopic("all");
  }

  initialize() async {
    accessToken = await gf.getToken();

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    token = '';
    // await messaging.getToken(
    //   vapidKey: "AIzaSyAW4Kg8QIn0GOBPfMeH4-qBiD1Za0SqaVk",
    // );

    print("TOKEN: $token");

    messaging.setForegroundNotificationPresentationOptions(
      alert: Platform.isAndroid,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        if (message.notification != null) {
          // showNotification(
          //     message.notification.title, message.notification.body
          // );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (accessToken != null && accessToken.length > 1) {
        FCMController.gotNewNotification = true;
        Get.to(() => HomeScreen());

      }
    });

    start();
  }

  showNotification(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 5),
      backgroundColor: AppColors.primarycolor, //Colors.white.withOpacity(0.4),
      colorText: Colors.white, //kGreen,
      onTap: (_) => Get.to(() => HomeScreen()),
    );
    print('$title : $message');
  }

// checkForInitialMessage() async {
//   RemoteMessage initialMessage =
//       await FirebaseMessaging.instance.getInitialMessage();

//   if (initialMessage != null) {
//     Get.to(() => EventsScreen());
//   }
// }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
