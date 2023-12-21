import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/models/availbility_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../helper/app_toast.dart';
import '../../../../../models/house_rules_model.dart';
import '../../controller.dart';

class AvaibilitySettingsLogic extends GetxController {
  //if null means same day
  int? advanceNoticeInDays;

  //if null means any time
  HourMinute? sameDayCutoffTime;

  //if null meane none
  int? preparationTime;

  //if null all future dates
  int? availbilityWindow;

  updateAvailability(String adId) {
    FirebaseFirestore.instance.collection('posts').doc(adId).update({
      'availbilitySettingsModel': AvailbilitySettingsModel(
              advanceNoticeInDays: advanceNoticeInDays,
              sameDayCutoffTime: sameDayCutoffTime,
              preparationTime: preparationTime,
              availbilityWindow: availbilityWindow)
          .toMap()
    }).then((value) {
      AppToast.showToast(message: 'updated post'.tr());
      Get.find<ListingStatusController>().update();
    }).catchError((e) {
      debugPrint('--->>>>>>  error  $e');
      AppToast.showToast(message: 'error while updating'.tr());
    });
    Get.back();
  }
}
