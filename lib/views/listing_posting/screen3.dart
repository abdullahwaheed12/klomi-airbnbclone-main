import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/views/listing_posting/screen4.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import '../../enums/best_describe_your_place_enum.dart';
import '../../utiles/kyes.dart';
import 'logic.dart';
import 'widgets/next_back.dart';

class BestDesribeYourPlace extends StatefulWidget {
  const BestDesribeYourPlace({
    super.key,
  });
  @override
  State<BestDesribeYourPlace> createState() => _BestDesribeYourPlaceState();
}

class _BestDesribeYourPlaceState extends State<BestDesribeYourPlace> {
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
                        'Which of these best describe your place'.tr(),
                        style: mediumTitle,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //1
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.house;
                                setState(() {});
                              },
                              iconImageUrl: countryHouseImagePath,
                              title: 'House'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.house,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.apartment;
                                setState(() {});
                              },
                              iconImageUrl: apartmentsImagePath,
                              title: 'Apartment'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.apartment,
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
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.barn;
                                setState(() {});
                              },
                              iconImageUrl: barnImagePath,
                              title: 'Barn'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.barn,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.breakfast;
                                setState(() {});
                              },
                              iconImageUrl: breakfastImagePath,
                              title: 'Bed & breakfast'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.breakfast,
                            ),
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
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.boat;
                                setState(() {});
                              },
                              iconImageUrl: boatImagePath,
                              title: 'Boat'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.boat,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.cabin;

                                setState(() {});
                              },
                              iconImageUrl: cabinImagePath,
                              title: 'Cabin'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.cabin,
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
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.camper;

                                setState(() {});
                              },
                              iconImageUrl: camperImagePath,
                              title: 'Camper/RV'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.camper,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.casaParticular;

                                setState(() {});
                              },
                              iconImageUrl: casaParticularImagePath,
                              title: 'Casa particular'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.casaParticular,
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
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.castle;

                                setState(() {});
                              },
                              iconImageUrl: castleImagePath,
                              title: 'Castle'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.castle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.cave;

                                setState(() {});
                              },
                              iconImageUrl: caveImagePath,
                              title: 'Cave'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.cave,
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
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.container;

                                setState(() {});
                              },
                              iconImageUrl: containerImagePath,
                              title: 'Container'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.container,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.cycladicHome;
                                setState(() {});
                              },
                              iconImageUrl: cycladicHomeImagePath,
                              title: 'Cycladic home'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.cycladicHome,
                            ),
                          ),
                        ],
                      ),

                      //7
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.dome;

                                setState(() {});
                              },
                              iconImageUrl: domeImagePath,
                              title: 'Dome'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.dome,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.farm;
                                setState(() {});
                              },
                              iconImageUrl: farmImagePath,
                              title: 'Farm'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.farm,
                            ),
                          ),
                        ],
                      ),

                      //8
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.guesthouse;

                                setState(() {});
                              },
                              iconImageUrl: guesthosueImagePath,
                              title: 'Guesthouse'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.guesthouse,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.hotel;

                                setState(() {});
                              },
                              iconImageUrl: hotelImagePath,
                              title: 'Hotel'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.hotel,
                            ),
                          ),
                        ],
                      ),
                      //9
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.tent;

                                setState(() {});
                              },
                              iconImageUrl: tentImagePath,
                              title: 'Tent'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.tent,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.tinyHome;
                                setState(() {});
                              },
                              iconImageUrl: tinyhomeImagePath,
                              title: 'Tiny home'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.tinyHome,
                            ),
                          ),
                        ],
                      ),
                      //10
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.tower;

                                setState(() {});
                              },
                              iconImageUrl: towerImagePath,
                              title: 'Tower'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.tower,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.treeHouse;
                                setState(() {});
                              },
                              iconImageUrl: treehosueImagePath,
                              title: 'Treehouse',
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.treeHouse,
                            ),
                          ),
                        ],
                      ),
                      //11
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.windmill;

                                setState(() {});
                              },
                              iconImageUrl: mindmillImagePath,
                              title: 'Windmill'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.windmill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BestDescribeCard(
                              onTap: () {
                                Get.find<ListingLogic>()
                                        .bestDescribeYourPlaceEnum =
                                    BestDescribeYourPlaceEnum.yurt;
                                setState(() {});
                              },
                              iconImageUrl: yurtImagePath,
                              title: 'Yurt'.tr(),
                              isSelected: Get.find<ListingLogic>()
                                      .bestDescribeYourPlaceEnum ==
                                  BestDescribeYourPlaceEnum.yurt,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              NextBack(
                onPressed: () {
                  var map = {
                    AppKeys.bestDescribeYourPlaceEnumKey:
                        Get.find<ListingLogic>().bestDescribeYourPlaceEnum
                  };
                  Get.to(() => TypesOfPlace(
                        allPreviousArgument: map,
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BestDescribeCard extends StatelessWidget {
  const BestDescribeCard(
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
            SizedBox(height: 25, width: 25, child: Image.asset(iconImageUrl)),
            const SizedBox(
              height: 25,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
