import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    var android = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var platform = InitializationSettings(android, ios);
    localNotificationsPlugin.initialize(platform);
    firebaseCloudMessaging_Listeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void firebaseCloudMessaging_Listeners() {
    void iOS_Permission() {
      _firebaseMessaging.requestNotificationPermissions(
          IosNotificationSettings(sound: true, badge: true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered
          .listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
    }

    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {});

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        showNotification(message);

        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void showNotification(Map<String, dynamic> message) async {
    var android = new AndroidNotificationDetails(
        "channel_id", "CHANNEL Name", "channelDescription");
    var ios = IOSNotificationDetails();
    var platformDetails = new NotificationDetails(android, ios);
    String title = message["notification"]["title"];
    String body = message["notification"]["body"];
    print(title);
    print(body);
    await localNotificationsPlugin.show(0, title, body, platformDetails);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Heloo',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
