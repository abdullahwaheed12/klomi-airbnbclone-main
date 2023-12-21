import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../models/house_rules_model.dart';
import '../../../../../../utiles/spacer.dart';
import '../logic.dart';

class SameDayCutOffTime extends StatefulWidget {
  const SameDayCutOffTime({super.key});

  @override
  State<SameDayCutOffTime> createState() => _SameDayCutOffTimeState();
}

class _SameDayCutOffTimeState extends State<SameDayCutOffTime> {
  var listOfTime = [
    HourMinute(hour: 06),
    HourMinute(hour: 07),
    HourMinute(hour: 08),
    HourMinute(hour: 09),
    HourMinute(hour: 10),
    HourMinute(hour: 11),
    HourMinute(hour: 12),
    HourMinute(hour: 13),
    HourMinute(hour: 14),
    HourMinute(hour: 15),
    HourMinute(hour: 16),
    HourMinute(hour: 17),
    HourMinute(hour: 18),
    HourMinute(hour: 19),
    HourMinute(hour: 20),
    HourMinute(hour: 21),
    HourMinute(hour: 22),
    HourMinute(hour: 23),
  ];
  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AvaibilitySettingsLogic>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...listOfTime.map((e) {
            return InkWell(
              onTap: () {
                logic.sameDayCutoffTime = e;
                logic.update();
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('${e.hour}:00'),
                  ],
                ),
              ),
            );
          }).toList(),
          const VerticalSpacer(16),
          InkWell(
            onTap: () {
              //if selected time is null then its means 'Any time'
              logic.sameDayCutoffTime = null;
              logic.update();
              Get.back();
            },
            child: Row(
              children: [
                Text('Any Time'.tr()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
