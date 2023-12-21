import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class AmenitiesFilter extends StatefulWidget {
  const AmenitiesFilter({super.key});

  @override
  State<AmenitiesFilter> createState() => _AmenitiesFilterState();
}

class _AmenitiesFilterState extends State<AmenitiesFilter> {
  var logic = Get.find<AdController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "amenities".tr().capitalize ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          AnimitiesListTile(
            title: "Wifi".tr(),
            isSelected: logic.animities.isWifi,
            onChanged: (p0) {
              setState(() {
                logic.animities.isWifi = p0 ?? false;
              });
            },
          ),
          AnimitiesListTile(
            title: "Kitchen".tr(),
            isSelected: logic.animities.isKitchen,
            onChanged: (p0) {
              setState(() {
                logic.animities.isKitchen = p0 ?? false;
              });
            },
          ),
          AnimitiesListTile(
            title: "Washer".tr(),
            isSelected: logic.animities.isWasher,
            onChanged: (p0) {
              setState(() {
                logic.animities.isWasher = p0 ?? false;
              });
            },
          ),
          if (logic.isAminitiesExpand) const MoreAnimities(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: InkWell(
              onTap: () {
                logic.isAminitiesExpand = !logic.isAminitiesExpand;
                logic.update();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    logic.isAminitiesExpand
                        ? 'show less'.tr()
                        : 'show more'.tr(),
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  Icon(
                    logic.isAminitiesExpand
                        ? Icons.expand_less
                        : Icons.expand_more,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class MoreAnimities extends StatelessWidget {
  const MoreAnimities({super.key});
  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AdController>();

    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimitiesListTile(
            title: "TV",
            isSelected: logic.animities.isTv,
            onChanged: (p0) {
              logic.animities.isTv = p0 ?? false;
              logic.update();
            },
          ),
          AnimitiesListTile(
            title: "Free parking on premises".tr(),
            isSelected: logic.animities.isFreeParking,
            onChanged: (p0) {
              logic.animities.isFreeParking = p0 ?? false;
              logic.update();
            },
          ),
          AnimitiesListTile(
            title: "Paid parking on premises".tr(),
            isSelected: logic.animities.isPaidParking,
            onChanged: (p0) {
              logic.animities.isPaidParking = p0 ?? false;
              logic.update();
            },
          ),
          AnimitiesListTile(
            title: 'Air conditioning'.tr(),
            isSelected: logic.animities.isAirConditioning,
            onChanged: (p0) {
              logic.animities.isAirConditioning = p0 ?? false;
              logic.update();
            },
          ),
          AnimitiesListTile(
            title: 'Dedicated workspace'.tr(),
            isSelected: logic.animities.isDedicatedWorkspace,
            onChanged: (p0) {
              logic.animities.isDedicatedWorkspace = p0 ?? false;
              logic.update();
            },
          ),
        ],
      );
    });
  }
}

class AnimitiesListTile extends StatelessWidget {
  const AnimitiesListTile(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onChanged});
  final String title;
  final bool isSelected;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          value: isSelected,
          onChanged: onChanged),
    );
  }
}
