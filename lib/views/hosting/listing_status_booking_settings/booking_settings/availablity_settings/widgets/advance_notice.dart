import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/utiles/spacer.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/availablity_settings/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class AdvanceNotice extends StatefulWidget {
  const AdvanceNotice({super.key});

  @override
  State<AdvanceNotice> createState() => _AdvanceNoticeState();
}

class _AdvanceNoticeState extends State<AdvanceNotice> {
  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AvaibilitySettingsLogic>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {
                logic.advanceNoticeInDays = null;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(10),
                  Text('Same day'.tr()),
                  const VerticalSpacer(10),
                ],
              )),
          InkWell(
              onTap: () {
                logic.advanceNoticeInDays = 1;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(8),
                  Text("At least 1 day's notice".tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.advanceNoticeInDays = 2;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(8),
                  Text("At least 2 day's notice".tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.advanceNoticeInDays = 3;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(8),
                  Text("At least 3 day's notice".tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.advanceNoticeInDays = 7;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(8),
                  Text("At least 7 day's notice".tr()),
                  const VerticalSpacer(8),
                ],
              )),
        ],
      ),
    );
  }
}
