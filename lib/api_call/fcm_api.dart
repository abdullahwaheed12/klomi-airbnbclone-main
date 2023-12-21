import 'dart:convert';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

var serverKey =
    'AAAAFxEUzrw:APA91bEoG8y0Eorkq46PzN4wbv3-kQRKs0CbHYlp2r0_afe-yInFMBJoXlHLoFhkfQGYrOuqpioT1pOY2KHNs4pzTfUQwxJyC8OozvFu9XEtzirHdgR7yg0qrymHcfh3f3fLISH1sL8C';

//--message
messageNotificationCall(String token, String? title, String body,
    {required Map<String, dynamic> data}) async {
  http.Response response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
          ...data
        },
        'to': token
      },
    ),
  );
  if (response.statusCode == 200) {
    debugPrint('status code 200');
    debugPrint(response.body);
  } else {
    debugPrint(response.toString());
  }
}

//-----
sendNotificaitonToAllUsers(String? title, String body,
    {required Map<String, dynamic> data}) async {
  http.Response response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '13',
          'status': 'done',
          ...data
        },
        'topic': "all",
      },
    ),
  );
  if (response.statusCode == 200) {
    debugPrint('status code 200');
    debugPrint(response.body);
  } else {
    debugPrint('error while sending notificaiton ${response.reasonPhrase}');
    debugPrint(response.toString());
  }
}

//-----
notificationCall(String token, String? title, String body,
    {required Map<String, dynamic> data}) async {
  http.Response response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
          ...data
        },
        'to': token
      },
    ),
  );
  if (response.statusCode == 200) {
    debugPrint('status code 200');
    debugPrint(response.body);
  } else {
    debugPrint(response.toString());
  }
}

//-----Calling

makeCallNotificationCall(String token, String? title, String body,
    {required Map<String, dynamic> data}) async {
  http.Response response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
          ...data
        },
        'to': token
      },
    ),
  );
  if (response.statusCode == 200) {
    debugPrint('status code 200');
    debugPrint(response.body);
  } else {
    debugPrint(response.toString());
  }
}
