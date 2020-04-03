import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';
import 'package:sailor/sailor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      navigatorObservers: [
        SailorLoggingObserver(),
        Routes.sailor.navigationStackObserver
      ],
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
