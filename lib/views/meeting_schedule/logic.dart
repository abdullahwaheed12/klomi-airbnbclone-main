import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../api_call/fcm_api.dart';
import '../../../models/user.dart';
import '../../../utiles/local__notifications__service.dart';
import '../../../utiles/videosdk_utils/api.dart';
import '../../controllers/general_controller.dart';
import '../../helper/app_toast.dart';
import '../../helper/main_helper.dart';
import '../../models/meeting.dart';
import '../../utiles/kyes.dart';

class MeetingLogic extends GetxController {
  var titleTEC = TextEditingController();
  var agendaTEC = TextEditingController();
  DateTime? startTime;
  DateTime? endTime;
  DateTime? dateTime;

  bool isValidForm() {
    if (titleTEC.text.isEmpty) {
      AppToast.showToast(message: 'Please enter meeting title'.tr());
      return false;
    } else if (agendaTEC.text.isEmpty) {
      AppToast.showToast(message: 'Please enter meeting agenda'.tr());
      return false;
    } else if (startTime == null) {
      AppToast.showToast(message: 'Please select starting dateTime'.tr());
      return false;
    } else if (endTime == null) {
      AppToast.showToast(message: 'Please select ending dateTime'.tr());
      return false;
    }
    return true;
  }

  saveMeeting(
      {required BuildContext context,
      required UserModel currentUser,
      required UserModel recevier}) async {
    if (isValidForm()) {
      showLoader(context);
      var differene = startTime!.difference(DateTime.now());
      var token = await fetchToken();
      var meetingID = await createMeeting(token);
      var meeting = Meeting(
          difference: DifferenceRemainingTime(
              days: differene.inDays,
              hours: differene.inHours,
              minute: differene.inMinutes),
          user1Name: currentUser.fullName,
          user2Name: recevier.fullName,
          meetingID: meetingID,
          meetingTitle: titleTEC.text,
          meetingAgenda: agendaTEC.text,
          start: startTime!,
          end: endTime!,
          users: [currentUser.uid, recevier.uid]);
      messageNotificationCall(recevier.messagingToken, 'Alert!'.tr(),
          '${currentUser.fullName} ${'has set a meeting with you check out for more info'.tr()}',
          data: {
            meetingSchedulingKey: true,
            startTimeKey: startTime?.millisecondsSinceEpoch,
            companyNameKey: currentUser.fullName
          });
      try {
        NotificationService().setAlarm(
            dateTime: startTime!.subtract(const Duration(minutes: 10)),
            title: 'Alarm!'.tr(),
            discription: '10 min remaining for the meeting'.tr());
      } catch (e) {
        debugPrint('error while scheduling 10 min before $e');
      }
      try {
        NotificationService().setAlarm(
            dateTime: startTime!.subtract(const Duration(hours: 10)),
            title: 'Alarm!'.tr(),
            discription: '10 hours remaining for the meeting'.tr());
      } catch (e) {
        debugPrint('error while scheduling 10 hours before $e');
      }

      FirebaseFirestore.instance
          .collection('meetings')
          .add(meeting.toMap())
          .then((value) {
        AppToast.showToast(message: 'Meeting saved'.tr());
        Get.back();
        Get.back();
      }).catchError((e) {
        log('error is ==>>> $e');
        AppToast.showToast(message: 'error while saving meeting'.tr());
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030));
    if (picked != null && picked != dateTime) {
      dateTime = picked;
      update();
    }
  }

  Future<void> selectStartingTime(BuildContext context) async {
    if (dateTime == null) {
      AppToast.showToast(message: 'Please select date first'.tr());
      return;
    }
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      startTime = DateTime(dateTime!.year, dateTime!.month, dateTime!.day,
          picked.hour, picked.minute);
      update();
    }
  }

  Future<void> selectEndingTime(BuildContext context) async {
    if (dateTime == null) {
      AppToast.showToast(message: 'Please select date first'.tr());
      return;
    }
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      endTime = DateTime(dateTime!.year, dateTime!.month, dateTime!.day,
          picked.hour, picked.minute);
      update();
    }
  }

  Future<List<Meeting>> fetchMeetings(String? receiverId) async {
    var docList = await FirebaseFirestore.instance
        .collection('meetings')
        .where('users',
            arrayContains:
                Get.find<GeneralGetxController>().currentUserModel!.uid)
        .where('end', isGreaterThan: DateTime.now().millisecondsSinceEpoch)
        .get();
    if (receiverId == null) {
      return docList.docs.map((e) => Meeting.fromMap(e.data())).toList();
    }
    var docs = docList.docs.map(
      (e) {
        List users = e.get('users');

        if (users.contains(receiverId)) {
          return e;
        }
      },
    ).toList();
    debugPrint('doc List ${docList.docs}');
    return docs.map((e) => Meeting.fromMap(e!.data())).toList();
  }

  bool isBetween(DateTime start, DateTime end) {
    DateTime now = DateTime.now();
    return start.isAfter(now);
  }
}
