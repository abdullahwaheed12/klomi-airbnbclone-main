import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/models/trip_length.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class TripLength extends StatefulWidget {
  const TripLength({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<TripLength> createState() => _TripLengthState();
}

class _TripLengthState extends State<TripLength> {
  var isAllowForLongerThen365 = false;
  var doNotallowReservationRequest = false;
  var minimum = TextEditingController();
  var maximum = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.exploreModel.tripLengthModel != null) {
      isAllowForLongerThen365 = widget.exploreModel.tripLengthModel!
              .manuallyReviewAndApproveReservationRequest ??
          false;
      doNotallowReservationRequest =
          widget.exploreModel.tripLengthModel!.doNotAllowReservationRequest ??
              false;
      print(
          '-->>>> ${widget.exploreModel.tripLengthModel!.doNotAllowReservationRequest}');
      minimum.text =
          (widget.exploreModel.tripLengthModel!.minimumStay ?? '').toString();
      maximum.text =
          (widget.exploreModel.tripLengthModel!.maximuStay ?? '').toString();
    }
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
          child: ListView(
            // shrinkWrap: true,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const DynamicVerticalSpace(30),
                Text(
                  'Trip length'.tr(),
                  style: largeTitle,
                ),
                const DynamicVerticalSpace(50),
                Text('Minimum stay (nights)'.tr()),
                const DynamicVerticalSpace(5),
                TextField(
                  controller: minimum,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
                //--
                const DviderApp(),
                //--
                const DynamicVerticalSpace(20),
                Text('Maximum stay (nights)'.tr()),
                const DynamicVerticalSpace(5),
                TextField(
                  controller: maximum,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
                //--
                const DviderApp(),
                const DynamicVerticalSpace(20),
                Text(
                  'For stays longer then 365 nights'.tr(),
                  style: smallTitle,
                ),
                const DynamicVerticalSpace(5),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            'Manually review and approve reservation requests'
                                .tr())),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    Checkbox(
                      value: isAllowForLongerThen365,
                      onChanged: (value) {
                        isAllowForLongerThen365 = !isAllowForLongerThen365;
                        setState(() {});
                      },
                    )
                  ],
                ),
                const DynamicVerticalSpace(20),
                const DviderApp(),
                const DynamicVerticalSpace(20),
                Row(
                  children: [
                    Expanded(
                        child: Text("Don't allow reservation requests".tr())),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    Checkbox(
                      value: doNotallowReservationRequest,
                      onChanged: (value) {
                        doNotallowReservationRequest =
                            !doNotallowReservationRequest;
                        setState(() {});
                      },
                    )
                  ],
                ),
                const DynamicVerticalSpace(20),
                const DviderApp(),
                const DynamicVerticalSpace(20),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.tripLengthModel = TripLengthModel(
              doNotAllowReservationRequest: doNotallowReservationRequest,
              manuallyReviewAndApproveReservationRequest:
                  isAllowForLongerThen365,
              maximuStay:
                  maximum.text.isNotEmpty ? int.parse(maximum.text) : null,
              minimumStay:
                  minimum.text.isNotEmpty ? int.parse(minimum.text) : null,
            );
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'updated trip length'.tr());
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
