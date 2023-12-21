import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class AccessibilityFeaturesFilters extends StatelessWidget {
  const AccessibilityFeaturesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AdController>();

    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Text(
              'Accessibility features'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: Text("Step-free guest entrance".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isStepFreeGuest,
              onChanged: (bool? value) {
                logic.isStepFreeGuest = value ?? false;
                logic.update();
              },
            ),
          ),
          ListTile(
            title: Text("Guest entrance wider the 32 inches".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isEntranceWiderThen32,
              onChanged: (bool? value) {
                logic.isEntranceWiderThen32 = value ?? false;
                logic.update();
              },
            ),
          ),
          ListTile(
            title: Text("Step-free path to the guest entrance".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isStepFreePath,
              onChanged: (bool? value) {
                logic.isStepFreePath = value ?? false;
                logic.update();
              },
            ),
          ),
          /*
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: InkWell(
              onTap: () {
                logic.isAccessibilityExpand = !logic.isAccessibilityExpand;
                logic.update();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    logic.isAccessibilityExpand
                        ? 'show less'.tr()
                        : 'show more'.tr(),
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  Icon(
                    logic.isAccessibilityExpand
                        ? Icons.expand_less
                        : Icons.expand_more,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        */
        ],
      );
    });
  }
}
