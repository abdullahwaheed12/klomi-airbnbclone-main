import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:klomi/views/hosting/host_trip/trips_empty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../enums/active_order_num.dart';
import '../../../global_widgets/trip_card.dart';
import 'trips_if_not_login.dart';

class CompleteTripsTraveler extends StatelessWidget {
  const CompleteTripsTraveler({super.key});

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
            'Complete Trips'.tr(),
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
                        .where('visitorId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .where('activeOrderStatus',
                            isEqualTo: ActiveOrderStatus.complete.name)
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
                                isHost: false,
                                obj: obj,
                                index: index,
                                snapshot: snapshot,
                                actionButton: const SizedBox(),
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
