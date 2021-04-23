import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pshnotif/push_notif_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Google Firebase
  await Firebase.initializeApp();
  pushNotifManager.init();
  // FirebaseMessaging.onBackgroundMessage(PushNotifManager.firebaseMessagingBackgroundHandler); // Firebase push notification

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pshnotif'),
      ),
      body: Column(
        children: [
          //
        ],
      ),
    );
  }
}
