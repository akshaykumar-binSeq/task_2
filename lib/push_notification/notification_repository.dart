// ignore_for_file: unused_catch_stack

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_2/domain/core/app_failures.dart';
import 'package:task_2/push_notification/fcm_token_cache.dart';

import 'i_notification_repository.dart';

class NotificationRepository implements INotificationRepository {
  NotificationRepository();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  Future<Either<AppFailures, dynamic>> registerDeviceNotification(
      String platform) async {
    String? token = await _fcm.getToken();

    FCMToken.fcmToken = token ?? '';

    log(token ?? "", error: 'FCM TOKEN');

    // Map<String, dynamic> payload = {
    //   "registration_id": token,
    //   "type": platform,
    // };
    return right('');
  }

  @override
  Future<bool> sendFCMMessage(String title, String message) async {
    try {
      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAAb-aazrA:APA91bH1TchKDl3Ajl6pzRPzXiJ7Pmoo4_dSvWR4hO6WXp4dA-FkxqwVfyvxkM7b7ggtgQA20fqrbQSyR9jq7yKkB9x_uRar5R7iKT_m2V7TRwx6ZxIrF9LHf5H53os6GmOQO4gyQla7",
      };
      var request = {
        'notification': {'title': title, 'body': message},
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'type': 'COMMENT'
        },
        'to': FCMToken.fcmToken
      };

      await Future.delayed(const Duration(seconds: 20));

      var response = await http.post(Uri.parse(url),
          headers: header, body: json.encode(request));

      response;

      return true;
    } catch (e, s) {
      return false;
    }
  }
}
