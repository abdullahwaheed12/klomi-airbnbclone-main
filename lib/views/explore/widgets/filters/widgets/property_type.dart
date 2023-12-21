import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';
import '../../../../listing_posting/screen9.dart';

class PropertyType extends StatelessWidget {
  const PropertyType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Property type".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          //1
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: AnimitiesCard(
                    onTap: () {
                      controller.isHouse = !controller.isHouse;
                      controller.update();
                    },
                    icon: Icons.house_siding_rounded,
                    title: 'House'.tr(),
                    isSelected: controller.isHouse,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AnimitiesCard(
                    onTap: () {
                      controller.isAppartment = !controller.isAppartment;
                      controller.update();
                    },
                    icon: Icons.apartment,
                    title: 'Apartment'.tr(),
                    isSelected: controller.isAppartment,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //2
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: AnimitiesCard(
                    onTap: () {
                      controller.isGuestHouse = !controller.isGuestHouse;
                      controller.update();
                    },
                    icon: Icons.house,
                    title: 'Guesthouse'.tr(),
                    isSelected: controller.isGuestHouse,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AnimitiesCard(
                      onTap: () {
                        controller.isHotel = !controller.isHotel;
                        controller.update();
                      },
                      icon: Icons.hotel,
                      isSelected: controller.isHotel,
                      title: 'Hotel'.tr()),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
