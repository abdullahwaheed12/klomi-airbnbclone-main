import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../../../../models/scnic_views.dart';
import '../controller.dart';

class ScenicViews extends StatefulWidget {
  const ScenicViews({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<ScenicViews> createState() => _ScenicViewsState();
}

class _ScenicViewsState extends State<ScenicViews> {
  late SenicView senicView;

  @override
  void initState() {
    senicView = widget.exploreModel.senicView ?? SenicView();
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
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const DynamicVerticalSpace(30),
              Text(
                'Senic views'.tr(),
                style: largeTitle,
              ),
              const DynamicVerticalSpace(10),
              Text("Views so photo-worthy they'll wow every guest.".tr()),
              const DynamicVerticalSpace(50),
              Row(
                children: [
                  Text('Bay View'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isBayView,
                    onChanged: (value) {
                      senicView.isBayView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Canal view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isCanalView,
                    onChanged: (value) {
                      senicView.isCanalView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('City skyline view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isCitySkyLineView,
                    onChanged: (value) {
                      senicView.isCitySkyLineView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Courtyard view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isCoutyarView,
                    onChanged: (value) {
                      senicView.isCoutyarView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Desert view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isDesertView,
                    onChanged: (value) {
                      senicView.isDesertView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Gardan view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isGardenVeiw,
                    onChanged: (value) {},
                  )
                ],
              ),
              Row(
                children: [
                  Text('Golf course view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isGolfView,
                    onChanged: (value) {
                      senicView.isGolfView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Harbor view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isHarborView,
                    onChanged: (value) {
                      senicView.isHarborView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Lake view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isLakeView,
                    onChanged: (value) {
                      senicView.isLakeView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Marina view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isMarinaView,
                    onChanged: (value) {
                      senicView.isMarinaView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Mountain view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isMountainView,
                    onChanged: (value) {
                      senicView.isMountainView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Ocean view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isOceanView,
                    onChanged: (value) {
                      senicView.isOceanView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Park view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isParkView,
                    onChanged: (value) {
                      senicView.isParkView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Pool view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isPoolView,
                    onChanged: (value) {
                      senicView.isPoolView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Resort view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isResortView,
                    onChanged: (value) {
                      senicView.isResortView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Sea view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isSeaViewl,
                    onChanged: (value) {
                      senicView.isSeaViewl = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Valley view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isValleyView,
                    onChanged: (value) {
                      senicView.isValleyView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Text('Vineyard view'.tr()),
                  const Spacer(),
                  Checkbox(
                    value: senicView.isVineyarView,
                    onChanged: (value) {
                      senicView.isVineyarView = value!;
                      setState(() {});
                    },
                  )
                ],
              ),
              const DynamicVerticalSpace(50)
            ]),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.senicView = senicView;
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'Updated scenic view'.tr());
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
