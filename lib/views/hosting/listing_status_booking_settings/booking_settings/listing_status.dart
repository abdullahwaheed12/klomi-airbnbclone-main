import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class ListingStatus extends StatelessWidget {
  const ListingStatus({super.key, required this.exploreModel});
  final ExploreModel exploreModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Listing status'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(30),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                const DynamicHorizontalSpace(12),
                Expanded(
                  child: Text.rich(TextSpan(
                      text: exploreModel.isListed ? 'relist' : 'Unlisted'.tr(),
                      style: smallTitle,
                      children: [
                        TextSpan(
                          text:
                              " - Geusts can't book this listing or find it in search results"
                                  .tr(),
                          style: smallDesc.copyWith(fontSize: 14),
                        ),
                      ])),
                )
              ],
            ),
            const DynamicVerticalSpace(30),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Alert'.tr()),
                    content: Text(
                        '${'Do you want to'.tr()} ${exploreModel.isListed ? 'relist'.tr() : 'Unlist'.tr()} ${'the listing'.tr()}'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Cancel'.tr())),
                      TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('posts')
                                .doc(exploreModel.adId)
                                .update({
                              'isListed': !exploreModel.isListed
                            }).then((value) {
                              AppToast.showToast(message: 'Updated'.tr());
                              Get.find<ListingStatusController>().update();
                            }).catchError((e) {
                              debugPrint('--->>>>>>  error  $e');
                              AppToast.showToast(
                                  message: 'error while updating'.tr());
                            });
                            Get.back();
                            Get.back();
                          },
                          child:  Text('Ok'.tr())),
                    ],
                  ),
                );
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Re-list'.tr()),
              ),
            ),
            const DynamicVerticalSpace(60),
            Text(
              'Change listing status'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(40),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'List'.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      'List'.tr(),
                      style: underLineText,
                    ),
                  ],
                ),
                const DynamicVerticalSpace(12),
                Text(
                  'Make your lisitng live in search results'.tr(),
                ),
                const DynamicVerticalSpace(20),
                const DviderApp(),
                const DynamicVerticalSpace(20),
                Row(
                  children: [
                    Text(
                      'Deactive'.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      'Deactive'.tr(),
                      style: underLineText,
                    ),
                  ],
                ),
                const DynamicVerticalSpace(12),
                Text(
                  'Permanently remove your listing from klomi'.tr(),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
