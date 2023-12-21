import 'package:klomi/views/listing_posting/widgets/amenities.dart';
import 'package:klomi/views/listing_posting/widgets/safty_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'logic.dart';
import 'screen10.dart';

class PlaceOffer extends StatefulWidget {
  const PlaceOffer({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;
  @override
  State<PlaceOffer> createState() => _PlaceOfferState();
}

class _PlaceOfferState extends State<PlaceOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Tell guests what your place has to offer'.tr(),
                        style: mediumTitle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "You can add more amenities after you publish your listing."
                              .tr()),
                      const SizedBox(
                        height: 20,
                      ),
                      //1
                      Row(
                        children: [
                          Expanded(
                            child: AnimitiesCard(
                              onTap: () {
                                Get.find<ListingLogic>().animities.isWifi =
                                    !Get.find<ListingLogic>().animities.isWifi;

                                setState(() {});
                              },
                              icon: Icons.wifi,
                              title: 'Wifi',
                              isSelected:
                                  Get.find<ListingLogic>().animities.isWifi,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                              onTap: () {
                                Get.find<ListingLogic>().animities.isTv =
                                    !Get.find<ListingLogic>().animities.isTv;

                                setState(() {});
                              },
                              icon: Icons.tv,
                              title: 'TV',
                              isSelected:
                                  Get.find<ListingLogic>().animities.isTv,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //2
                      Row(
                        children: [
                          Expanded(
                            child: AnimitiesCard(
                              onTap: () {
                                Get.find<ListingLogic>().animities.isKitchen =
                                    !Get.find<ListingLogic>()
                                        .animities
                                        .isKitchen;

                                setState(() {});
                              },
                              icon: Icons.kitchen_outlined,
                              title: 'Kitchen',
                              isSelected:
                                  Get.find<ListingLogic>().animities.isKitchen,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  Get.find<ListingLogic>().animities.isWasher =
                                      !Get.find<ListingLogic>()
                                          .animities
                                          .isWasher;

                                  setState(() {});
                                },
                                icon: Icons.local_laundry_service,
                                isSelected:
                                    Get.find<ListingLogic>().animities.isWasher,
                                title: 'Washer'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //3
                      Row(
                        children: [
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  Get.find<ListingLogic>()
                                          .animities
                                          .isFreeParking =
                                      !Get.find<ListingLogic>()
                                          .animities
                                          .isFreeParking;

                                  setState(() {});
                                },
                                icon: Icons.directions_car,
                                isSelected: Get.find<ListingLogic>()
                                    .animities
                                    .isFreeParking,
                                title: 'Free parking on premises'.tr()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  Get.find<ListingLogic>()
                                          .animities
                                          .isPaidParking =
                                      !Get.find<ListingLogic>()
                                          .animities
                                          .isPaidParking;

                                  setState(() {});
                                },
                                icon: Icons.local_parking,
                                isSelected: Get.find<ListingLogic>()
                                    .animities
                                    .isPaidParking,
                                title: 'Paid parking on premises'.tr()),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //4
                      Row(
                        children: [
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  Get.find<ListingLogic>()
                                          .animities
                                          .isAirConditioning =
                                      !Get.find<ListingLogic>()
                                          .animities
                                          .isAirConditioning;
                                  setState(() {});
                                },
                                isSelected: Get.find<ListingLogic>()
                                    .animities
                                    .isAirConditioning,
                                icon: Icons.ac_unit,
                                title: 'Air conditioning'.tr()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  Get.find<ListingLogic>()
                                          .animities
                                          .isDedicatedWorkspace =
                                      !Get.find<ListingLogic>()
                                          .animities
                                          .isDedicatedWorkspace;
                                  setState(() {});
                                },
                                isSelected: Get.find<ListingLogic>()
                                    .animities
                                    .isDedicatedWorkspace,
                                icon: Icons.work_outline_sharp,
                                title: 'Dedicated workspace'.tr()),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Amenities(),
                      const SaftyItem()
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Back'.tr(),
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddImages(
                              allPreviousArgu: widget.allPreviousArgu),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Next'.tr()),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimitiesCard extends StatelessWidget {
  const AnimitiesCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.isSelected});
  final String title;
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: isSelected ? 2 : 1),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 35,
            ),
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
