import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/enums/choose_cancellation_policy.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/utiles/math_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../controllers/general_controller.dart';
import '../../../helper/app_toast.dart';

class ChooseCancellationPolicy extends StatefulWidget {
  const ChooseCancellationPolicy({super.key});

  @override
  State<ChooseCancellationPolicy> createState() =>
      _ChooseCancellationPolicyState();
}

class _ChooseCancellationPolicyState extends State<ChooseCancellationPolicy> {
  var cancellationPolicy = 0;
  var generalGetxController = Get.find<GeneralGetxController>();

  @override
  void initState() {
    super.initState();
    debugPrint(generalGetxController
        .currentUserModel!.choseCancellationPolicy?.index
        .toString());
    if (generalGetxController.currentUserModel!.choseCancellationPolicy !=
        null) {
      cancellationPolicy = generalGetxController
              .currentUserModel!.choseCancellationPolicy!.index +
          1;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose a cancellation policy'.tr(),
                    style: largeTitle,
                  )),
              //1
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Flexible'.tr(),
                  ),
                ),
                subtitle: Text("Full refund 1 day prior to arrival".tr()),
                trailing: Radio(
                  value: 1,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.flexible;
                      cancellationPolicy = value ?? 1;
                    });
                  },
                ),
              ),
              //2
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Flexible or Non-refundable'.tr(),
                  ),
                ),
                subtitle: Text(
                    "In addition to Flexible, offer a non-refundable option-guests pay 10% less, but you keep your payout no matter when they cancel."
                        .tr()),
                trailing: Radio(
                  value: 2,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.flexibleOrNonFlexible;
                      cancellationPolicy = value ?? 2;
                    });
                  },
                ),
              ),
              //3
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Moderate'.tr(),
                  ),
                ),
                subtitle: Text("Full refund 5 days prior to arrival".tr()),
                trailing: Radio(
                  value: 3,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.moderate;

                      cancellationPolicy = value ?? 3;
                    });
                  },
                ),
              ),
              //4
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Firm'.tr(),
                  ),
                ),
                subtitle: Text(
                    "Full refund for cancellations up to 30 days before check-in. If booked fewer than 30 days before check-in, full refund for cancellations made within 48 hours of booking and at least 14 days before check-in. After that, 50% refund up to 7 days before check-in. No refund after that."
                        .tr()),
                trailing: Radio(
                  value: 4,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.firm;

                      cancellationPolicy = value ?? 4;
                    });
                  },
                ),
              ),
              //5
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Firm or Non-refundable'.tr(),
                  ),
                ),
                subtitle: Text(
                    "In addition to Firm, offer a non-refundable option guests pay 10% less, but you keep your payout no matter when they cancel."
                        .tr()),
                trailing: Radio(
                  value: 5,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.firmOrNonRefundable;
                      cancellationPolicy = value ?? 5;
                    });
                  },
                ),
              ),
              //6
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Strict'.tr(),
                  ),
                ),
                subtitle: Text(
                    "Full refund for cancellations made within 48 hours of booking, if the check-in date is at least 14 days away. 50% refund for cancellations made at least 7 days before check-in. No refunds for cancellations made within 7 days of check-in."
                        .tr()),
                trailing: Radio(
                  value: 6,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.strict;
                      cancellationPolicy = value ?? 6;
                    });
                  },
                ),
              ),
              //7
              const VerticalSpace25px(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Strict or Non-refundable'.tr(),
                  ),
                ),
                subtitle: Text(
                    "In addition to Strict, offer a non-refundable option guests pay 10% less, but you keep your payout no matter when they cancel."
                        .tr()),
                trailing: Radio(
                  value: 7,
                  groupValue: cancellationPolicy,
                  onChanged: (value) {
                    setState(() {
                      generalGetxController
                              .currentUserModel!.choseCancellationPolicy =
                          ChoseCancellationPolicy.strictORNonStrict;
                      cancellationPolicy = value ?? 7;
                    });
                  },
                ),
              ),
              const DynamicVerticalSpace(70)
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.white,
        width: size.width,
        height: 60,
        child: Center(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 45),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    generalGetxController.currentUserModelRef.reference.update({
                      'choseCancellationPolicy': generalGetxController
                          .currentUserModel!.choseCancellationPolicy!.name
                    }).then((value) {
                      AppToast.showToast(message: 'updated cancellation policy'.tr());
                    }).catchError((e) {
                      debugPrint('--->>>>>>  error  $e');
                      AppToast.showToast(
                          message: 'error while updating'.tr());
                    });
                    Get.back();
                  },
                  child: Text(
                    'Confirm'.tr(),
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
