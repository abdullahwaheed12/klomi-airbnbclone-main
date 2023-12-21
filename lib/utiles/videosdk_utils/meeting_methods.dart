// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

import '../../enums/calling_status.dart';
import '../../views/calling/scaffold.dart';
import '../../views/live_metting/scaffold.dart';
import '../kyes.dart';
import 'api.dart';
import 'toast.dart';

callingUpdate(String callingId, CallingStatus callingStatus) async {
  await FirebaseFirestore.instance
      .collection('calling')
      .doc(callingId)
      .update({'callingStatus': callingStatus.name});
}

endCallFirebaseUpdate(String callingId) async {
  await FirebaseFirestore.instance
      .collection('calling')
      .doc(callingId)
      .delete();
}

Future<void> showCallkitIncoming(RemoteMessage message) async {
  await FlutterCallkitIncoming.showCallkitIncoming(
    CallKitParams(
        appName: 'Klomi Aribnb',
        avatar: message.data[profileUrlKey],
        duration: 30000,
        handle: message.data[emailKey],
        id: '---',
        nameCaller: message.data[displayNameKey],
        textAccept: 'Accept',
        textDecline: 'Decline',
        textMissedCall: 'Missed call',
        textCallback: 'Call back',
        type: 0,
        extra: message.data,
        headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
        android: AndroidParams(
            isCustomNotification: true,
            isShowLogo: false,
            isShowCallback: false,
            ringtonePath: 'system_ringtone_default',
            backgroundColor: '#0955fa',
            backgroundUrl: message.data[profileUrlKey],
            actionColor: '#4CAF50',
            incomingCallNotificationChannelName: "Incoming Call",
            missedCallNotificationChannelName: "Missed Call",
            isCustomSmallExNotification: true,
            isShowMissedCallNotification: true),
        ios: IOSParams(
            iconName: 'CallKitLogo',
            handleType: '',
            supportsVideo: true,
            maximumCallGroups: 2,
            maximumCallsPerCallGroup: 1,
            audioSessionMode: 'default',
            audioSessionActive: true,
            audioSessionPreferredSampleRate: 44100.0,
            audioSessionPreferredIOBufferDuration: 0.005,
            supportsDTMF: true,
            supportsHolding: true,
            supportsGrouping: false,
            supportsUngrouping: false,
            ringtonePath: 'system_ringtone_default')),
  );
}

Future<void> joinCalling(String displayName, String meetingId, String callingId,
    BuildContext context) async {
  if (meetingId.isEmpty) {
    return;
  }
  var token = await fetchToken();
  print('--->>> token fetched $token');
  var validMeeting = await validateMeeting(token, meetingId);
  print('--->>> validMeeting $validMeeting');

  if (validMeeting) {
    List list = await FlutterCallkitIncoming.activeCalls();
    FlutterCallkitIncoming.endAllCalls();
    log('--->>> ${list.length}');
    GetStorage().remove('callFromTerminateState');
    await callingUpdate(callingId, CallingStatus.receive);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OneToOneMeetingScreen(
            callingId: callingId,
            isCaller: false,
            token: token,
            meetingId: meetingId,
            displayName: displayName,
            micEnabled: true,
            camEnabled: false,
          ),
        ));
  } else {
    showSnackBarMessage(message: "Invalid Meeting ID".tr(), context: context);
  }
}

Future<void> joinLiveStreaming(
    String displayName, String meetingId, BuildContext context) async {
  if (meetingId.isEmpty) {
    return;
  }
  var token = await fetchToken();
  print('--->>> token fetched $token');
  var validMeeting = await validateMeeting(token, meetingId);
  print('--->>> validMeeting $validMeeting');

  if (validMeeting) {
    Get.to(() => ConfereneceMeetingScreen(
          token: token,
          meetingId: meetingId,
          displayName: displayName,
          micEnabled: true,
          camEnabled: false,
        ));
  } else {
    showSnackBarMessage(message: "Invalid Meeting ID".tr(), context: context);
  }
}
