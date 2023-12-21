import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class Directions extends StatefulWidget {
  const Directions({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<Directions> createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  var direction = TextEditingController();

  @override
  void initState() {
    direction.text = widget.exploreModel.direction;
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
              'Directions'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(50),
            TextField(
              maxLines: 6,
              controller: direction,
              decoration: InputDecoration(
                  hintText:
                      'Share directions to your place and public transport and parking tips.'
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
                .update({'direction': direction.text}).then((value) {
              AppToast.showToast(message: 'Updated direction'.tr());
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
