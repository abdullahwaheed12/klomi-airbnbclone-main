import 'package:get/get.dart';
import 'dart:collection';
import 'dart:developer';

import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderLogic extends GetxController {
  @override
  void onInit() {
    getEvents();
    super.onInit();
  }

  setEvents() {
    for (var item in Get.find<GeneralGetxController>().activeAdsList!) {
      for (DateTime date in item.exploreModel.selectedDates) {
        var eventList = kEvents[date];

        if (eventList == null) {
          kEvents[date] = [item];
          print('-->>>eventList :$kEvents ');
        } else {
          kEvents[date] = eventList;
        }
      }
    }
    log('events $kEvents');
  }

  late LinkedHashMap<DateTime, List<ActiveAd>> kEvents;
  LinkedHashMap<DateTime, List<ActiveAd>> getEvents() {
    kEvents = LinkedHashMap<DateTime, List<ActiveAd>>(
        equals: isSameDay, hashCode: getHashCode);
    return LinkedHashMap<DateTime, List<ActiveAd>>(
        equals: isSameDay, hashCode: getHashCode);
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  final kToday = DateTime.now();
  DateTime get kFirstDay => DateTime(kToday.year, kToday.month - 3, kToday.day);
  DateTime get kLastDay => DateTime(kToday.year, kToday.month + 3, kToday.day);
}
