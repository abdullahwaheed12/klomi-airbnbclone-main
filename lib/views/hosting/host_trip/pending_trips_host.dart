import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/api_call/fcm_api.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/enums/active_order_num.dart';
import 'package:klomi/helper/app_toast.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:klomi/views/hosting/host_trip/trips_empty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../global_widgets/trip_card.dart';
import '../../../models/notifications.dart';
import 'trips_if_not_login.dart';

class PendingTripHost extends StatelessWidget {
  const PendingTripHost({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return const TripsIfNotLogin();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          leading: MaterialButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: Text(
            'Pending Trips'.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('ActiveAds')
                        .where('hostId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .where('activeOrderStatus',
                            isEqualTo: ActiveOrderStatus.pending.name)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var listActiveAds = snapshot.data!.docs
                            .map((e) => ActiveAd.fromMap(e.data()))
                            .toList();
                        if (listActiveAds.isEmpty) {
                          return const EmptyTripsHost();
                        } else {
                          return ListView.builder(
                            itemCount: listActiveAds.length,
                            itemBuilder: (context, index) {
                              var obj = listActiveAds[index];
                              return TripCard(
                                isPending: true,
                                obj: obj,
                                index: index,
                                snapshot: snapshot,
                                actionButton: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('ActiveAds')
                                          .doc(snapshot.data!.docs[index].id)
                                          .update({
                                        'activeOrderStatus':
                                            ActiveOrderStatus.accept.name
                                      }).then((value) {
                                        sendNotificationToTheTraveler(
                                          obj.visitorId,
                                          ActiveOrderStatus.accept,
                                          true,
                                        );
                                        AppToast.showToast(
                                            message:
                                                'Updated order status'.tr());
                                      }).catchError((e) {
                                        AppToast.showToast(
                                            message:
                                                '${'error'.tr()} $e ${'while updating order status'.tr()}');
                                      });
                                    },
                                    child: Text(
                                      'Accept'.tr(),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

sendNotificationToTheTraveler(
    String userID, ActiveOrderStatus activeOrderStatus, bool isHost) async {
  var user = await Get.find<GeneralGetxController>().getUserData(userID);
  var body =
      '${Get.find<GeneralGetxController>().currentUserModel!.fullName} ${'given you rating and review'.tr()}';
  messageNotificationCall(user.messagingToken, 'Alert!', body, data: {});
  //save notification to the firestore
  var notification = NotificationsModel(
      receiverUid: userID,
      isHost: isHost,
      body: body,
      imageUrl: Get.find<GeneralGetxController>().currentUserModel!.imageUrl,
      activeOrderStatus: activeOrderStatus,
      dateTime: DateTime.now());
  FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toMap());
}
