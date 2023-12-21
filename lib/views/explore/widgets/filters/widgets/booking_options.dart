import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Text(
              'Booking options'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: Text("Instant Book".tr()),
            subtitle: Text("Book without waiting for the host to respond".tr()),
            trailing: Switch(
              value: controller.isInstant,
              onChanged: (value) {
                controller.isInstant = value;
                controller.update();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("Self check-in".tr()),
            subtitle: Text("Easy access to the property once you arrive".tr()),
            trailing: Switch(
              value: controller.isSelfCheckIn,
              onChanged: (value) {
                controller.isSelfCheckIn = value;
                controller.update();
              },
            ),
          ),
        ],
      );
    });
  }
}
