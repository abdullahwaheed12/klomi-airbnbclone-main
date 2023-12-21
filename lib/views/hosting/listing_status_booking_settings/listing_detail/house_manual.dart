import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class HouseManual extends StatefulWidget {
  const HouseManual({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<HouseManual> createState() => _HouseManualState();
}

class _HouseManualState extends State<HouseManual> {
  late TextEditingController houseManual;
  @override
  void initState() {
    houseManual = TextEditingController(text: widget.exploreModel.houseManual);
    super.initState();
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DynamicVerticalSpace(30),
            Text(
              'House manual'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(50),
            TextField(
              controller: houseManual,
              maxLines: 6,
              decoration: InputDecoration(
                  hintText:
                      'Offer Guests some tirps about your listing, such as how to access the internet or turn on the hot water.'
                          .tr()),
            ),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update({'houseManual': houseManual.text}).then((value) {
              AppToast.showToast(message: 'Updated house manual'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating'.tr());
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
