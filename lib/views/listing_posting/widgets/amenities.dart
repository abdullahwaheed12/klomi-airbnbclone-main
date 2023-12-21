import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../logic.dart';

class Amenities extends StatefulWidget {
  const Amenities({super.key});

  @override
  State<Amenities> createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Do you have any standout amenities?'.tr(),
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
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPool =
                        !Get.find<ListingLogic>().standtOutAmenitieModel.isPool;
                  });
                },
                iconImageUrl: poolImagePath,
                title: 'Pool'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPool,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isHotTub =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isHotTub;
                  });
                },
                iconImageUrl: caveImagePath,
                title: 'Hot tub'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isHotTub,
              ),
            ),
          ],
        ),
        //2
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPatio =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isPatio;
                  });
                },
                iconImageUrl: patioImagePath,
                title: 'Patio'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPatio,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isBBQGrill =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isBBQGrill;
                  });
                },
                iconImageUrl: bBQGrillImagePath,
                title: 'BBQ grill'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isBBQGrill,
              ),
            ),
          ],
        ),
        //3
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isOutdoordiningArea =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isOutdoordiningArea;
                  });
                },
                iconImageUrl: outdoorDiningAreaImagePath,
                title: 'Outdoor dining area'.tr(),
                isSelected: Get.find<ListingLogic>()
                    .standtOutAmenitieModel
                    .isOutdoordiningArea,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isFirePit =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isFirePit;
                  });
                },
                iconImageUrl: firePitImagePath,
                title: 'Fire pit'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isFirePit,
              ),
            ),
          ],
        ),
        //4
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isPoolTable =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isPoolTable;
                  });
                },
                iconImageUrl: poolTableImagePath,
                title: 'Pool table'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPoolTable,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isInDoorFirePlace =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isInDoorFirePlace;
                  });
                },
                iconImageUrl: indoorFireplaceImagePath,
                title: 'Indoor fireplace'.tr(),
                isSelected: Get.find<ListingLogic>()
                    .standtOutAmenitieModel
                    .isInDoorFirePlace,
              ),
            ),
          ],
        ),
        //5
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPiano =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isPiano;
                  });
                },
                iconImageUrl: pianoImagePath,
                title: 'Piano'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isPiano,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isExerciseEquipment =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isExerciseEquipment;
                  });
                },
                iconImageUrl: exerciseEquipmentImagePath,
                title: 'Exercise equipments'.tr(),
                isSelected: Get.find<ListingLogic>()
                    .standtOutAmenitieModel
                    .isExerciseEquipment,
              ),
            ),
          ],
        ),
        //6
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isLakeAccess =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isLakeAccess;
                  });
                },
                iconImageUrl: lakeAccessImagePath,
                title: 'Lake access'.tr(),
                isSelected: Get.find<ListingLogic>()
                    .standtOutAmenitieModel
                    .isLakeAccess,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isBeach =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isBeach;
                  });
                },
                iconImageUrl: beachImagePath,
                title: 'Beach access'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isBeach,
              ),
            ),
          ],
        ),
        //6
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>().standtOutAmenitieModel.isSkiIn =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isSkiIn;
                  });
                },
                iconImageUrl: skiInImagePath,
                title: 'Ski-in/Ski-out'.tr(),
                isSelected:
                    Get.find<ListingLogic>().standtOutAmenitieModel.isSkiIn,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AmenitiesCard(
                onTap: () {
                  setState(() {
                    Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isOutdoorShower =
                        !Get.find<ListingLogic>()
                            .standtOutAmenitieModel
                            .isOutdoorShower;
                  });
                },
                iconImageUrl: outdooShowerImagePath,
                title: 'Outdoor shower'.tr(),
                isSelected: Get.find<ListingLogic>()
                    .standtOutAmenitieModel
                    .isOutdoorShower,
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
