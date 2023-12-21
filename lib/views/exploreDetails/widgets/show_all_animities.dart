import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../contstant/image_path.dart';
import '../../../models/explore_model.dart';

class ShowAllAnimities extends StatelessWidget {
  const ShowAllAnimities({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'What this place offers'.tr(),
                  style: mediumTitle,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  ''.tr(),
                  style: smallTitle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                ShowAllAnimitiesModel(
                    title: 'Wifi'.tr(),
                    icon: Icons.wifi,
                    isSelected: exploreModel.animities.isWifi),
                ShowAllAnimitiesModel(
                    title: 'TV'.tr(),
                    icon: Icons.tv,
                    isSelected: exploreModel.animities.isTv),
                ShowAllAnimitiesModel(
                    title: 'Kitchen'.tr(),
                    icon: Icons.kitchen_outlined,
                    isSelected: exploreModel.animities.isKitchen),
                ShowAllAnimitiesModel(
                    title: 'Washer'.tr(),
                    icon: Icons.local_laundry_service,
                    isSelected: exploreModel.animities.isWasher),
                ShowAllAnimitiesModel(
                    title: 'Free parking on premises'.tr(),
                    icon: Icons.directions_car,
                    isSelected: exploreModel.animities.isFreeParking),
                ShowAllAnimitiesModel(
                    title: 'Paid parking on premises'.tr(),
                    icon: Icons.local_parking,
                    isSelected: exploreModel.animities.isPaidParking),
                ShowAllAnimitiesModel(
                    title: 'Air conditioning'.tr(),
                    icon: Icons.ac_unit,
                    isSelected: exploreModel.animities.isAirConditioning),
                ShowAllAnimitiesModel(
                    title: 'Dedicated workspace'.tr(),
                    icon: Icons.work_outline_sharp,
                    isSelected: exploreModel.animities.isDedicatedWorkspace),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Standout Amenities'.tr(),
                  style: smallTitle,
                ),
                const SizedBox(
                  height: 20,
                ),
                ShowAllAnimitiesModel(
                    title: 'Pool'.tr(),
                    iconImageUrl: poolImagePath,
                    isSelected: exploreModel.standoutAmenities.isPool),
                ShowAllAnimitiesModel(
                    iconImageUrl: caveImagePath,
                    title: 'Hot tub'.tr(),
                    isSelected: exploreModel.standoutAmenities.isHotTub),
                ShowAllAnimitiesModel(
                    iconImageUrl: patioImagePath,
                    title: 'Patio'.tr(),
                    isSelected: exploreModel.standoutAmenities.isPatio),
                ShowAllAnimitiesModel(
                    iconImageUrl: bBQGrillImagePath,
                    title: 'BBQ grill'.tr(),
                    isSelected: exploreModel.standoutAmenities.isBBQGrill),
                ShowAllAnimitiesModel(
                    iconImageUrl: outdoorDiningAreaImagePath,
                    title: 'Outdoor dining area'.tr(),
                    isSelected:
                        exploreModel.standoutAmenities.isOutdoordiningArea),
                ShowAllAnimitiesModel(
                    iconImageUrl: firePitImagePath,
                    title: 'Fire pit'.tr(),
                    isSelected: exploreModel.standoutAmenities.isFirePit),
                ShowAllAnimitiesModel(
                    iconImageUrl: poolTableImagePath,
                    title: 'Pool table'.tr(),
                    isSelected: exploreModel.standoutAmenities.isPoolTable),
                ShowAllAnimitiesModel(
                    iconImageUrl: indoorFireplaceImagePath,
                    title: 'Indoor fireplace'.tr(),
                    isSelected:
                        exploreModel.standoutAmenities.isInDoorFirePlace),
                ShowAllAnimitiesModel(
                    iconImageUrl: pianoImagePath,
                    title: 'Piano'.tr(),
                    isSelected: exploreModel.standoutAmenities.isPiano),
                ShowAllAnimitiesModel(
                    iconImageUrl: exerciseEquipmentImagePath,
                    title: 'Exercise equipments'.tr(),
                    isSelected:
                        exploreModel.standoutAmenities.isExerciseEquipment),
                ShowAllAnimitiesModel(
                    iconImageUrl: beachImagePath,
                    title: 'Beach access'.tr(),
                    isSelected: exploreModel.standoutAmenities.isBeach),
                ShowAllAnimitiesModel(
                    iconImageUrl: lakeAccessImagePath,
                    title: 'Lake access'.tr(),
                    isSelected: exploreModel.standoutAmenities.isLakeAccess),
                ShowAllAnimitiesModel(
                    iconImageUrl: skiInImagePath,
                    title: 'Ski-in/Ski-out'.tr(),
                    isSelected: exploreModel.standoutAmenities.isSkiIn),
                ShowAllAnimitiesModel(
                    iconImageUrl: outdooShowerImagePath,
                    title: 'Outdoor shower'.tr(),
                    isSelected: exploreModel.standoutAmenities.isOutdoorShower),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Safety items'.tr(),
                  style: smallTitle,
                ),
                const SizedBox(
                  height: 20,
                ),
                ShowAllAnimitiesModel(
                    iconImageUrl: smokeAlarmImagePath,
                    title: 'Smoke alarm'.tr(),
                    isSelected: true),
                ShowAllAnimitiesModel(
                    iconImageUrl: firstAidKitImagePath,
                    title: 'First aid kit'.tr(),
                    isSelected: true),
                ShowAllAnimitiesModel(
                    iconImageUrl: fireExtinguisherImagePath,
                    title: 'Fire extinguisher'.tr(),
                    isSelected: true),
                ShowAllAnimitiesModel(
                    iconImageUrl: carbanMonoxideAlarmImagePath,
                    title: 'Carbon monoxide'.tr(),
                    isSelected: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowAllAnimitiesModel extends StatelessWidget {
  const ShowAllAnimitiesModel(
      {super.key,
      this.icon,
      required this.title,
      this.iconImageUrl,
      required this.isSelected});
  final String title;
  final IconData? icon;
  final String? iconImageUrl;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            iconImageUrl != null
                ? SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      iconImageUrl!,
                      color: isSelected ? Colors.black : Colors.grey,
                    ))
                : Icon(
                    icon,
                    size: 30,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  decoration: isSelected
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
