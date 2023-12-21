import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/models/house_rules_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../helper/app_toast.dart';
import '../listing_status_booking_settings/controller.dart';

class HouseRulesLogic extends GetxController {
  bool? isPetAllowed;
  bool? isEventAllowed;
  bool? isSmokingVapingAllowed;
  bool? isSetQuietHours;
  bool? isCommercialPhotographyFilmingAllowed;
  TimeOfDay from = const TimeOfDay(hour: 10, minute: 30);
  TimeOfDay to = const TimeOfDay(hour: 0, minute: 30);

  @override
  void onInit() {
    var houseModel =
        Get.find<GeneralGetxController>().currentUserModel!.houseRulesModel;
    if (houseModel != null) {
      isPetAllowed = houseModel.isPetAllowed;
      isEventAllowed = houseModel.isEventAllowed;
      isSmokingVapingAllowed = houseModel.isSmookingAllowed;
      isSetQuietHours = houseModel.isSetQuithours;
      isCommercialPhotographyFilmingAllowed =
          houseModel.isCommercialPhotoGraphyAllowed;
      from = TimeOfDay(
          hour: houseModel.quitFrom.hour, minute: houseModel.quitFrom.minute);
      to = TimeOfDay(
          hour: houseModel.quitTo.hour, minute: houseModel.quitTo.minute);
    }

    super.onInit();
  }

  updateHouseRules() {
    var houseModel = HouseRulesModel(
        isPetAllowed: isPetAllowed,
        isEventAllowed: isEventAllowed,
        isSetQuithours: isSetQuietHours,
        isSmookingAllowed: isSmokingVapingAllowed,
        isCommercialPhotoGraphyAllowed: isCommercialPhotographyFilmingAllowed,
        quitFrom: HourMinute(
          hour: from.hour,
          minute: from.minute,
        ),
        quitTo: HourMinute(
          hour: to.hour,
          minute: to.minute,
        ));
    Get.find<GeneralGetxController>()
        .currentUserModelRef
        .reference
        .update({'houseRulesModel': houseModel.toMap()}).then((value) {
      Get.find<GeneralGetxController>().currentUserModel!.houseRulesModel =
          houseModel;
      AppToast.showToast(message: 'updated houseRules'.tr());
      try {
        Get.find<ListingStatusController>().update();
      } catch (e) {
        debugPrint(e.toString());
      }
    }).catchError((e) {
      debugPrint('--->>>>>>  error  $e');
      AppToast.showToast(message: 'error while updating houseRules'.tr());
    });
    Get.back();
  }
}
