import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../contstant/text_styles.dart';
import '../../../../helper/app_toast.dart';
import '../../../../models/animities.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class PlaceAminities extends StatefulWidget {
  const PlaceAminities({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<PlaceAminities> createState() => _PlaceAminitiesState();
}

class _PlaceAminitiesState extends State<PlaceAminities> {
  var animities = Animities();
  @override
  void initState() {
    super.initState();
    animities = widget.exploreModel.animities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Update animities'.tr(),
          style: mediumTitle,
        ),
      ),
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
                        height: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //1
                      Row(
                        children: [
                          Expanded(
                            child: AnimitiesCard(
                              onTap: () {
                                animities.isWifi = !animities.isWifi;

                                setState(() {});
                              },
                              icon: Icons.wifi,
                              title: 'Wifi'.tr(),
                              isSelected: animities.isWifi,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                              onTap: () {
                                animities.isTv = !animities.isTv;

                                setState(() {});
                              },
                              icon: Icons.tv,
                              title: 'TV'.tr(),
                              isSelected: animities.isTv,
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
                                animities.isKitchen = !animities.isKitchen;

                                setState(() {});
                              },
                              icon: Icons.kitchen_outlined,
                              title: 'Kitchen'.tr(),
                              isSelected: animities.isKitchen,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  animities.isWasher = !animities.isWasher;

                                  setState(() {});
                                },
                                icon: Icons.local_laundry_service,
                                isSelected: animities.isWasher,
                                title: 'Washer'.tr()),
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
                                  animities.isFreeParking =
                                      !animities.isFreeParking;

                                  setState(() {});
                                },
                                icon: Icons.directions_car,
                                isSelected: animities.isFreeParking,
                                title: 'Free parking on premises'.tr()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  animities.isPaidParking =
                                      !animities.isPaidParking;

                                  setState(() {});
                                },
                                icon: Icons.local_parking,
                                isSelected: animities.isPaidParking,
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
                                  animities.isAirConditioning =
                                      !animities.isAirConditioning;
                                  setState(() {});
                                },
                                isSelected: animities.isAirConditioning,
                                icon: Icons.ac_unit,
                                title: 'Air conditioning'.tr()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AnimitiesCard(
                                onTap: () {
                                  animities.isDedicatedWorkspace =
                                      !animities.isDedicatedWorkspace;
                                  setState(() {});
                                },
                                isSelected: animities.isDedicatedWorkspace,
                                icon: Icons.work_outline_sharp,
                                title: 'Dedicated workspace'.tr()),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.animities = animities;
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'updated animities'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating images');
            });
            Get.back();
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
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
