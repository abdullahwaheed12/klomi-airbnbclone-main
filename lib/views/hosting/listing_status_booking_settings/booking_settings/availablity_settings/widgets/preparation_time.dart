import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../utiles/spacer.dart';
import '../logic.dart';

class PreparationTime extends StatelessWidget {
  const PreparationTime({super.key});

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
                logic.preparationTime = null;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(10),
                  Text('None'.tr()),
                  const VerticalSpacer(10),
                ],
              )),
          InkWell(
              onTap: () {
                logic.preparationTime = 1;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('For 1 night before and after'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
          InkWell(
              onTap: () {
                logic.preparationTime = 2;
                logic.update();
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerticalSpacer(8),
                  Text('For 2 night before and after'.tr()),
                  const VerticalSpacer(8),
                ],
              )),
        ],
      ),
    );
  }
}
