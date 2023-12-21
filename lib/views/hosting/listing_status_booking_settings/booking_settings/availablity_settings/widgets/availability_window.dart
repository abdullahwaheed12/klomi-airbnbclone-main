import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../utiles/spacer.dart';
import '../logic.dart';

class AvailabilityWindow extends StatelessWidget {
  const AvailabilityWindow({super.key});

  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AvaibilitySettingsLogic>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {
                logic.availbilityWindow = null;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(10),
                  Text('All future dates'.tr()),
                  const VerticalSpacer(10),
                ],
              )),
          InkWell(
              onTap: () {
                logic.availbilityWindow = 12;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('12 months in advance'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.availbilityWindow = 9;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('9 months in advance'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.availbilityWindow = 6;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('6 months in advance'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.availbilityWindow = 3;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('3 months in advance'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
          // InkWell(
          //     onTap: () {},
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: const [
          //         VerticalSpacer(8),
          //         Text('Dates unavailable by default'),
          //         VerticalSpacer(8),
          //       ],
          //     )),
        ],
      ),
    );
  }
}
