import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/models/host_setting.dart';
import 'package:klomi/utiles/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../helper/app_toast.dart';
import '../listing_status_booking_settings/controller.dart';

class InstantBooking extends StatefulWidget {
  const InstantBooking({super.key});

  @override
  State<InstantBooking> createState() => _InstantBookingState();
}

class _InstantBookingState extends State<InstantBooking> {
  var isInstantBook = true;
  var isIdentityVerification = false;
  var isGoodTrackRecord = false;
  var generalGetxController = Get.find<GeneralGetxController>();
  @override
  void initState() {
    isInstantBook =
        generalGetxController.currentUserModel!.hostSettings.isInstantBook;
    isIdentityVerification = generalGetxController
        .currentUserModel!.hostSettings.shouldIdentityVerification;
    isGoodTrackRecord = generalGetxController
        .currentUserModel!.hostSettings.shouldGoodTrackRecord;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How guests can book'.tr(),
                  style: largeTitle,
                )),
            //1
            const VerticalSpace25px(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Instant Book'.tr(),
                  style: mediumTitle,
                ),
              ),
              subtitle: Text(
                  "When this is on, bookings are accepted automatically, When off, you'll need to manually accept or decline booking requests."
                      .tr()),
              trailing: CupertinoSwitch(
                value: isInstantBook,
                onChanged: (bool newValue) {
                  if (!newValue) {
                    isGoodTrackRecord = false;
                    isIdentityVerification = false;
                  }
                  setState(() {
                    isInstantBook = newValue;
                  });
                },
              ),
            ),
            const VerticalSpace25px(),
            const DviderApp(),
            //2
            const VerticalSpace25px(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Optional Instant Book settings'.tr(),
                  style: mediumTitle,
                ),
              ),
              subtitle: Text(
                  "These settings are available when Instant Book is on. Guest who don't meet these requirements can send booking requests."
                      .tr()),
            ),
            const VerticalSpace25px(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Identity verification'.tr(),
                ),
              ),
              subtitle: Text(
                  "Only allow guests who have been verified through our multi-step process."
                      .tr()),
              trailing: CupertinoSwitch(
                value: isIdentityVerification,
                onChanged: !isInstantBook
                    ? null
                    : (bool newValue) {
                        setState(() {
                          isIdentityVerification = newValue;
                        });
                      },
              ),
            ),
            const VerticalSpace25px(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Good track record'.tr(),
                ),
              ),
              subtitle: Text(
                  "Only allow guests who have stayed on Klomi without incidents or negitive reviews."
                      .tr()),
              trailing: CupertinoSwitch(
                value: isGoodTrackRecord,
                onChanged: !isInstantBook
                    ? null
                    : (bool newValue) {
                        setState(() {
                          isGoodTrackRecord = newValue;
                        });
                      },
              ),
            ),
            const VerticalSpace25px(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Pre-booking message'.tr(),
                ),
              ),
              subtitle: generalGetxController
                      .currentUserModel!.hostSettings.preBookMessage.isNotEmpty
                  ? Text(generalGetxController
                      .currentUserModel!.hostSettings.preBookMessage)
                  : Text(
                      "Require guests to read and respond to a message before they confirm their reservation."
                          .tr()),
              trailing: InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    builder: (context) => const PreBookingMessage(),
                  );
                  setState(() {});
                },
                child: Text(
                  generalGetxController.currentUserModel!.hostSettings
                          .preBookMessage.isNotEmpty
                      ? 'Edit'.tr()
                      : 'Add'.tr(),
                  style: const TextStyle(
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 45),
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            var hostSettings = HostSettings(
                isInstantBook: isInstantBook,
                shouldIdentityVerification: isIdentityVerification,
                shouldGoodTrackRecord: isGoodTrackRecord);
            generalGetxController.currentUserModelRef.reference
                .update({'hostSettings': hostSettings.toMap()}).then((value) {
              AppToast.showToast(message: 'Updated instantBooking charges'.tr());
              generalGetxController.currentUserModel!.hostSettings =
                  hostSettings;
              try {
                Get.find<ListingStatusController>().update();
              } catch (e) {
                debugPrint('eeee $e');
              }
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(
                  message: 'error while updating instantBooking charges'.tr());
            });
            Get.back();
          },
          child: Text(
            'Confirm'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}

class PreBookingMessage extends StatefulWidget {
  const PreBookingMessage({super.key});

  @override
  State<PreBookingMessage> createState() => _PreBookingMessageState();
}

class _PreBookingMessageState extends State<PreBookingMessage> {
  var generalGetxController = Get.find<GeneralGetxController>();
  var preBookingMessage = TextEditingController();
  @override
  void initState() {
    preBookingMessage.text =
        generalGetxController.currentUserModel!.hostSettings.preBookMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              InkWell(onTap: () => Get.back(), child: const Icon(Icons.clear)),
              const HorizontalSpacer(),
              Text(
                'Pre-booking message'.tr(),
                style: smallTitle,
              )
            ],
          ),
          const VerticalSpacer(),
          TextField(
            controller: preBookingMessage,
            maxLines: 5,
            maxLength: 400,
          ),
          const DviderApp(),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:  Text('Cancel'.tr())),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    generalGetxController.currentUserModel!.hostSettings
                        .preBookMessage = preBookingMessage.text;

                    generalGetxController.currentUserModelRef.reference.update({
                      'hostSettings': generalGetxController
                          .currentUserModel!.hostSettings
                          .toMap()
                    }).then((value) {
                      AppToast.showToast(message: 'Updated preBooking message'.tr());
                      generalGetxController.currentUserModel!.hostSettings
                          .preBookMessage = preBookingMessage.text;
                      Get.find<ListingStatusController>().update();
                    }).catchError((e) {
                      debugPrint('--->>>>>>  error  $e');
                      AppToast.showToast(
                          message: 'error while updating preBooking message'.tr());
                    });
                    Get.back();
                  },
                  child: const Text('Save'))
            ],
          ),
          const VerticalSpacer(),
        ],
      ),
    );
  }
}
