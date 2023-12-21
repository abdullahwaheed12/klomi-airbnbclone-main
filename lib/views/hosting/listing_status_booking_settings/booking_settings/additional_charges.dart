import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/models/additional_chargers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class AditionalCharges extends StatefulWidget {
  const AditionalCharges({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<AditionalCharges> createState() => _AditionalChargesState();
}

class _AditionalChargesState extends State<AditionalCharges> {
  var isCleaning = false;
  var isPetAllowed = false;
  var isExtraGeust = false;
  var cleaningFeeTEC = TextEditingController();
  var petFeeTEC = TextEditingController();
  var extraGuestTEC = TextEditingController();
  @override
  void initState() {
    if (widget.exploreModel.additionalCharges != null) {
      if (widget.exploreModel.additionalCharges!.cleaningFee != null) {
        isCleaning = true;
        cleaningFeeTEC.text =
            widget.exploreModel.additionalCharges!.cleaningFee.toString();
      }
      //--
      if (widget.exploreModel.additionalCharges!.petFee != null) {
        isPetAllowed = true;
        petFeeTEC.text =
            widget.exploreModel.additionalCharges!.petFee.toString();
      }
      //--
      if (widget.exploreModel.additionalCharges!.extraGuestFee != null) {
        isExtraGeust = true;
        extraGuestTEC.text =
            widget.exploreModel.additionalCharges!.extraGuestFee.toString();
      }
      //--
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DynamicVerticalSpace(30),
            Text(
              'Additional Charges'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(50),
            Row(
              children: [
                Text(
                  'Cleaning Fee'.tr(),
                  style: smallTitle,
                ),
                const Spacer(),
                Switch(
                  value: isCleaning,
                  onChanged: (value) {
                    isCleaning = !isCleaning;
                    setState(() {});
                  },
                )
              ],
            ),
            if (isCleaning)
              TextField(
                keyboardType: TextInputType.number,
                controller: cleaningFeeTEC,
                decoration:
                    InputDecoration(hintText: 'Enter cleaning fee'.tr()),
              ),
            const DynamicVerticalSpace(20),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            Row(
              children: [
                Text(
                  'Pet fee'.tr(),
                  style: smallTitle,
                ),
                const Spacer(),
                Switch(
                  value: isPetAllowed,
                  onChanged: (value) {
                    isPetAllowed = !isPetAllowed;

                    setState(() {});
                  },
                )
              ],
            ),
            if (isPetAllowed)
              TextField(
                keyboardType: TextInputType.number,
                controller: petFeeTEC,
                decoration:  InputDecoration(hintText: 'Enter pet fee'.tr()),
              ),
            const DynamicVerticalSpace(20),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            Row(
              children: [
                Text(
                  'Extra guest fee'.tr(),
                  style: smallTitle,
                ),
                const Spacer(),
                Switch(
                  value: isExtraGeust,
                  onChanged: (value) {
                    isExtraGeust = !isExtraGeust;
                    setState(() {});
                  },
                )
              ],
            ),
            if (isExtraGeust)
              TextField(
                keyboardType: TextInputType.number,
                controller: extraGuestTEC,
                decoration: InputDecoration(
                    hintText: 'Enter extra guest fee for each guest'.tr()),
              ),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            var additionalCharges = AdditionalCharges();
            if (isCleaning) {
              additionalCharges.cleaningFee =
                  double.tryParse(cleaningFeeTEC.text);
            } else {
              // additionalCharges.cleaningFee =
              //     widget.exploreModel.additionalCharges?.cleaningFee;
            }
            //--
            if (isExtraGeust) {
              additionalCharges.extraGuestFee =
                  double.tryParse(extraGuestTEC.text);
            } else {
              // additionalCharges.extraGuestFee =
              //     widget.exploreModel.additionalCharges?.extraGuestFee;
            }
            //--
            if (isPetAllowed) {
              additionalCharges.petFee = double.tryParse(petFeeTEC.text);
            } else {
              // additionalCharges.petFee =
              //     widget.exploreModel.additionalCharges?.petFee;
            }

            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update({'additionalCharges': additionalCharges.toMap()}).then(
                    (value) {
              AppToast.showToast(message: 'updated additional charges'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(
                  message: 'error while updating additional charges'.tr());
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
