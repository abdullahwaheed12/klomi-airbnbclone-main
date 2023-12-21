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

class NightlyPrice extends StatefulWidget {
  const NightlyPrice({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<NightlyPrice> createState() => _NightlyPriceState();
}

class _NightlyPriceState extends State<NightlyPrice> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: widget.exploreModel.price);
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
              'Nightly Price'.tr(),
              style: largeTitle,
            ),
            Text(
                'Set your price to dynamically match demand or add a base price.'
                    .tr()),
            const DynamicVerticalSpace(50),
            //--
            Text(
              'Base price'.tr(),
              style: mediumTitle,
            ),
            const DynamicVerticalSpace(20),
            Text('Price per night'.tr()),
            const DynamicVerticalSpace(5),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            const DviderApp(),
            const DynamicVerticalSpace(20),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.price = controller.text;

            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'updated nightly price'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating nightly price'.tr());
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
