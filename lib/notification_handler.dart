import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationHandler {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  late String? token;

  NotificationHandler() {
    init();
  }

  Future<void> init() async {
    await messaging.subscribeToTopic('all');
    token = await messaging.getToken();
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> sendNotification() async {
    final post = await http.post(
        Uri.parse(
          'https://fcm.googleapis.com/fcm/send',
        ),
        headers: {
          HttpHeaders.authorizationHeader:
              'key=AAAAvY7Yz3Q:APA91bEu2MvMOVwz8pU0rPxCeT0JLjiJgRlICcmADDbXzF93udZdtdusWQ92CCgMo_sj3ymLuohF2jCxdctzms3KgMFgDWNNKGvIYGkxyhWGoS9R-Z7OnaXJhveQjeT7Jsku4bvNNuhc',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode({
          "notification": {
            "body": "Notification from postman",
            "title": "You have a new message."
          },
          "priority": "high",
          "data": {
            "clickaction": "FLUTTERNOTIFICATIONCLICK",
            "id": "1",
            "status": "done"
          },
          "to": "/topics/all"
        }));

    if (post.statusCode != 200) {
      throw Exception('ERROR ${post.statusCode}');
    }
  }
}
