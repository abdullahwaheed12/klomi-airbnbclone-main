import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class TopTierStays extends StatelessWidget {
  const TopTierStays({super.key});

  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AdController>();

    return GetBuilder<AdController>(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Text(
              'Top tier stays'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("Superhost".tr()),
            subtitle: Text("Stay with recognized Hosts".tr()),
            trailing: Switch(
              value: logic.isSuperHost,
              onChanged: (value) {
                logic.isSuperHost = value;
                logic.update();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("klomi plus".tr()),
            subtitle: Text(
                "A selection of places to stay verified for quality and design"
                    .tr()),
            trailing: Switch(
              value: logic.isklomiPlus,
              onChanged: (value) {
                logic.isklomiPlus = value;
                logic.update();
              },
            ),
          ),
        ],
      );
    });
  }
}
