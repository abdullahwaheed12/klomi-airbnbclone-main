import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../logic.dart';

class SaftyItem extends StatefulWidget {
  const SaftyItem({super.key});

  @override
  State<SaftyItem> createState() => _SaftyItemState();
}

class _SaftyItemState extends State<SaftyItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Do you have any of these safety items?'.tr(),
          style: smallTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        //1
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().saftyAlarm.isSmokeAlarm =
                        !Get.find<ListingLogic>().saftyAlarm.isSmokeAlarm;
                  });
                },
                iconImageUrl: smokeAlarmImagePath,
                title: 'Smoke alarm'.tr(),
                isSelected: Get.find<ListingLogic>().saftyAlarm.isSmokeAlarm,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().saftyAlarm.isFirstAidKit =
                        !Get.find<ListingLogic>().saftyAlarm.isFirstAidKit;
                  });
                },
                iconImageUrl: firstAidKitImagePath,
                title: 'First aid kit'.tr(),
                isSelected: Get.find<ListingLogic>().saftyAlarm.isFirstAidKit,
              ),
            ),
          ],
        ),
        //1
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().saftyAlarm.isFireExtinguisher =
                        !Get.find<ListingLogic>().saftyAlarm.isFireExtinguisher;
                  });
                },
                iconImageUrl: fireExtinguisherImagePath,
                title: 'Fire extinguisher'.tr(),
                isSelected:
                    Get.find<ListingLogic>().saftyAlarm.isFireExtinguisher,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().saftyAlarm.isCarbonMonoxideAlarm =
                        !Get.find<ListingLogic>()
                            .saftyAlarm
                            .isCarbonMonoxideAlarm;
                  });
                },
                iconImageUrl: carbanMonoxideAlarmImagePath,
                title: 'Carbon monoxide'.tr(),
                isSelected:
                    Get.find<ListingLogic>().saftyAlarm.isCarbonMonoxideAlarm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AmenitiesCard extends StatelessWidget {
  const AmenitiesCard(
      {super.key,
      required this.iconImageUrl,
      required this.title,
      required this.onTap,
      required this.isSelected});
  final String title;
  final String iconImageUrl;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: isSelected ? 2 : 1),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40, width: 40, child: Image.asset(iconImageUrl)),
            const SizedBox(
              height: 15,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
