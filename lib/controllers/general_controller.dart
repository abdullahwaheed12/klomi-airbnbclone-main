import 'dart:developer';

import 'package:klomi/enums/active_order_num.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../views/hosting/calendar/logic.dart';
import '../views/login/login_screen.dart';

class GeneralGetxController extends GetxController {
  static GeneralGetxController instance = Get.find<GeneralGetxController>();
  Future<UserModel> getUserData(String uid) async {
    final db = FirebaseFirestore.instance.collection("users");
    final doc = await db.doc(uid).get();
    UserModel user = UserModel.fromMap(doc.data() as Map<String, dynamic>);
    return user;
  }

  late DocumentSnapshot<UserModel> currentUserModelRef;

  UserModel? currentUserModel;
  updateUser(UserModel userModel) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(userModel.toMap());
    log('update user data fcm token');
  }

  updateUserToken() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }

    var token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'messagingToken': token}).then(
            (value) => debugPrint('update token success'));
    debugPrint("Refreshed token: $token");
  }

  getCurrentUserData() async {
    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return;
    }

    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromMap(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();
    if (userDoc.exists) {
      currentUserModelRef = userDoc;
      currentUserModel = currentUserModelRef.data()!;
    } else {
      Get.offAll(() => const LogIn());
      FirebaseAuth.instance.signOut();
    }
    log(currentUserModel.toString());
    update();
  }

  List<ActiveAd>? activeAdsList;

  getCurrentHostBookings() async {
    var activeAds = await FirebaseFirestore.instance
        .collection('ActiveAds')
        .where('hostId', isEqualTo: currentUserModel?.uid)
        .where(
          'activeOrderStatus',
          isEqualTo: ActiveOrderStatus.accept.name,
        )
        .withConverter<ActiveAd>(
          fromFirestore: (snapshot, options) =>
              ActiveAd.fromMap(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();
    activeAdsList = activeAds.docs.map((e) => e.data()).toList();
    Get.put(CalenderLogic()).setEvents();
    log('activeAdsList--->>>>>$activeAdsList');
    update();
  }
}
