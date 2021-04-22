import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


TextEditingController controller = TextEditingController();
TextEditingController type = TextEditingController();
TextEditingController title = TextEditingController();
TextEditingController message = TextEditingController();

initializeFCM() async {
  // await Firebase.initializeApp();
  print("INITIALIZING FCM");
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.setAutoInitEnabled(true);
  FirebaseMessaging.onMessage.listen((event) {
    print("\nOnMessage");
    type.text = "OnMessage";
    print("Title = "+event.notification.title+"   Body = "+event.notification.body);
    title.text = event.notification.title;
    message.text = event.notification.body;
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("\nonMessageOpenedApp");
    type.text = "onMessageOpenedApp";
    print("Title = "+event.notification.title+"   Body = "+event.notification.body);
    title.text = event.notification.title;
    message.text = event.notification.body;
  });
  String token = await messaging.getToken();
  print(token);
  controller.text = token;
  messaging.onTokenRefresh.listen((event) {controller.text = event;});
  
  print("FCM INITIALISED");
}