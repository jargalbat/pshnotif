// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
//
// import 'func.dart';
//
// class LocalNotifHelper {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
//
//   static final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();
//
//   static NotificationAppLaunchDetails notificationAppLaunchDetails;
//
//   static final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');
//
//   static void init() async {
//     try {
//       notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//
//       var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//       var initializationSettingsIOS = IOSInitializationSettings(
//           requestAlertPermission: false,
//           requestBadgePermission: false,
//           requestSoundPermission: false,
//           onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
//             didReceiveLocalNotificationSubject.add(ReceivedNotification(id: id, title: title, body: body, payload: payload));
//           });
//
//       var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
//
//       await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
//         if (payload != null) {
//           debugPrint('notification payload: ' + payload);
//         }
//         selectNotificationSubject.add(payload);
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   static void requestIOSPermissions() {
//     try {
//       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   static void configureDidReceiveLocalNotificationSubject(BuildContext context) {
//     didReceiveLocalNotificationSubject.stream.listen((ReceivedNotification receivedNotification) async {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: receivedNotification.title != null ? Text(receivedNotification.title) : null,
//           content: receivedNotification.body != null ? Text(receivedNotification.body) : null,
//           actions: [
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               child: Text('Ok'),
//               onPressed: () async {
//                 Navigator.of(context, rootNavigator: true).pop();
//                 print('test');
//               },
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   static void configureSelectNotificationSubject() {
//     selectNotificationSubject.stream.listen((String payload) async {
//       print('test');
//     });
//   }
//
//   static Future<void> showNotification(String title, String body) async {
//     try {
//       var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'your channel id',
//         'your channel name',
//         'your channel description',
//         importance: Importance.Max,
//         priority: Priority.High,
//         ticker: 'ticker',
//         styleInformation: BigTextStyleInformation(''),
//       );
//       var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//       var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//       await flutterLocalNotificationsPlugin.show(0, Func.toStr(title), Func.toStr(body), platformChannelSpecifics, payload: 'item x');
//       print('done');
//     } catch (e) {
//       print(e);
//     }
//   }
// }
//
// class ReceivedNotification {
//   final int id;
//   final String title;
//   final String body;
//   final String payload;
//
//   ReceivedNotification({
//     @required this.id,
//     @required this.title,
//     @required this.body,
//     @required this.payload,
//   });
// }
