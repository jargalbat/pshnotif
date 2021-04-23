// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

PushNotifManager pushNotifManager = PushNotifManager();

class PushNotifManager {
  FirebaseMessaging messaging = FirebaseMessaging();
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  init() async {
    _initFirebase();
    _initLocalNotif();
  }

  _initFirebase() async {
    String token = await messaging.getToken();
    print(token);

    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    //
    // print('User granted permission: ${settings.authorizationStatus}');

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');
    //
    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //
    //     showLocalNotif(message.notification.title, message.notification.body);
    //   }
    // });

    messaging.configure(onMessage: (Map<String, dynamic> message) {
      print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data}');

      // if (message.notification != null) {
      //   print('Message also contained a notification: ${message.notification}');
      //
      //   showLocalNotif(message.notification.title, message.notification.body);
      // }
      return Future.microtask(() => true);
    }, onResume: (Map<String, dynamic> message) {
      //
      return Future.microtask(() => true);
    }, onLaunch: (Map<String, dynamic> message) {
      //
      return Future.microtask(() => true);
    });
  }

  _initLocalNotif() async {
    // const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    // final MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings();
    // final InitializationSettings initializationSettings =
    //     InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS, macOS: initializationSettingsMacOS);
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: _selectNotification);
  }

  Future _onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           print('');
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  Future _selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  showLocalNotif(String title, String body) async {
    // const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //     'your channel id', 'your channel name', 'your channel description',
    //     importance: Importance.max, priority: Priority.high, showWhen: false);
    // const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // const NotificationDetails platformChannelSpecifics = NotificationDetails(
    //   android: androidPlatformChannelSpecifics,
    //   iOS: iOSPlatformChannelSpecifics,
    // );
    //
    // await flutterLocalNotificationsPlugin.show(0, title ?? '', body ?? '', platformChannelSpecifics, payload: 'item x');
  }
}
