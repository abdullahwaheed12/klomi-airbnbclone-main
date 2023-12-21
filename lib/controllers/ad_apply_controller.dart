import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/enums/active_order_num.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:klomi/models/explore_model.dart';
import 'package:klomi/helper/app_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' hide Trans;
import 'package:klomi/models/user.dart';

import '../api_call/fcm_api.dart';
import '../models/host_setting.dart';
import '../models/notifications.dart';
import '../views/AllViews/all_views.dart';
import 'adpost_controller.dart';

class AdApplyController extends GetxController {
  List<DateTime> convertDateRangeToList(DateTime start, DateTime end) {
    List<DateTime> dateList = [];
    DateTime date = start;
    while (date.isBefore(end) || date.isAtSameMomentAs(end)) {
      dateList.add(date);
      date = date.add(const Duration(days: 1));
    }
    return dateList;
  }

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  apply(ExploreModel exploreModel, double serviceFee, int days,
      UserModel hostData) async {
    if (selectedStartDate == null || selectedEndDate == null) {
      AppToast.showToast(message: 'Select stay date'.tr());
      Get.back();
      return;
    }
    if (FirebaseAuth.instance.currentUser == null) {
      AppToast.showToast(message: 'Login First for reservation'.tr());
      return;
    }
    var selectedDatesLists =
        convertDateRangeToList(exploreModel.start, exploreModel.end);
    exploreModel.selectedDates.addAll(selectedDatesLists);
    //update the selected dates
    FirebaseFirestore.instance
        .collection('posts')
        .doc(exploreModel.adId)
        .update({
      'selectedDates': exploreModel.selectedDates
          .map((e) => e.millisecondsSinceEpoch)
          .toList()
    });
    var userData = await Get.find<GeneralGetxController>()
        .getUserData(exploreModel.hostId);
    //send notification
    notificationCall(userData.messagingToken, 'Alert!'.tr(),
        '${userData.fullName} ${'there is a new order for you to check'.tr()}',
        data: {'animities': exploreModel.animities.toMap()});
    //save notification
    //save notification to the firestore
    var notification = NotificationsModel(
        receiverUid: exploreModel.hostId,
        isHost: false,
        body:
            '${userData.fullName} ${'there is a new order for you to check'.tr()}',
        imageUrl: Get.find<GeneralGetxController>().currentUserModel!.imageUrl,
        activeOrderStatus: ActiveOrderStatus.pending,
        dateTime: DateTime.now());
    FirebaseFirestore.instance
        .collection('notifications')
        .add(notification.toMap());
    var user = Get.find<GeneralGetxController>().currentUserModel!;
    if (hostData.hostSettings.isInstantBook) {}
    await FirebaseFirestore.instance.collection('ActiveAds').doc().set(ActiveAd(
            days: days,
            serviceFee: serviceFee,
            visitorPhotoUrl: user.imageUrl,
            visitorName: user.fullName,
            hostId: exploreModel.hostId,
            activeOrderStatus: showAutoAccept(hostData.hostSettings)
                ? ActiveOrderStatus.accept
                : ActiveOrderStatus.pending,
            visitorId: user.uid,
            exploreModel: exploreModel)
        .toMap());
    Get.find<AdController>().fetchAds();
    Get.off(() => const AllViews());
    AppToast.showToast(message: 'Reservation successful'.tr());
  }

  bool showAutoAccept(HostSettings hostSettings) {
    var user = Get.find<GeneralGetxController>().currentUserModel!;
    if (hostSettings.isInstantBook) {
      //check both false
      if (!hostSettings.shouldIdentityVerification &&
          !hostSettings.shouldGoodTrackRecord) {
        return true;
        //check both true
      } else if (hostSettings.shouldIdentityVerification &&
          hostSettings.shouldGoodTrackRecord) {
        //if rattings is less then 2 it means negative rattings
        if (user.idCardPhotoUrl == null && user.rattings < 2) {
          return false;
        } else {
          return true;
        }
        //check shouldIdentityVerification true
      } else if (hostSettings.shouldIdentityVerification) {
        if (user.idCardPhotoUrl == null) {
          return false;
        } else {
          return true;
        }
        //check shouldGoodTrackRecord true
      } else {
        //if rattings is less then 2 it means negative rattings

        if (user.rattings < 2) {
          return false;
        } else {
          return true;
        }
      }
    } else {
      return false;
    }
  }
}
