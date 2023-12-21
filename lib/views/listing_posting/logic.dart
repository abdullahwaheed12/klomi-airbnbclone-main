import 'dart:io';

import 'package:klomi/enums/ad_listing_status.dart';
import 'package:klomi/models/animities.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_call/fcm_api.dart';
import '../../controllers/general_controller.dart';
import '../../enums/best_describe_your_place_enum.dart';
import '../../models/standout_animities_model.dart';
import '../../models/explore_model.dart';
import '../../models/host_model.dart';
import '../../models/safty_alarm_items.dart';

class ListingLogic extends GetxController {
  StandoutAmenitieModel standtOutAmenitieModel =
      StandoutAmenitieModel(isBeach: true);
  Animities animities = Animities();
  SaftyItems saftyAlarm = SaftyItems(
    isCarbonMonoxideAlarm: true,
  );

  BestDescribeYourPlaceEnum bestDescribeYourPlaceEnum =
      BestDescribeYourPlaceEnum.house;

  publishAd(Map allArguments) async {
    var user = Get.find<GeneralGetxController>().currentUserModel!;

    List<XFile> images = allArguments[AppKeys.imagesFileKey];
    var imageUrl = <String>[];
    for (int i = 0; i < images.length; i++) {
      var url = await uploadFile(File(images[i].path));
      imageUrl.add(url);
    }
    var firebaseDoc = FirebaseFirestore.instance.collection('posts').doc();
    var obj = ExploreModel(
        isListed: true,
        isActive: true,
        houseManual: '',
        direction: '',
        selectedDates: [],
        adListingStatus: AdListingStatus.pending,
        animities: animities,
        standoutAmenities: standtOutAmenitieModel,
        saftyItems: saftyAlarm,
        hostId: FirebaseAuth.instance.currentUser!.uid,
        adId: firebaseDoc.id,
        images: imageUrl,
        title: allArguments[AppKeys.cabinTitleKey],
        bestDescribeYourPlaceEnum: bestDescribeYourPlaceEnum,
        distance: '0',
        availableTime: '1 day',
        price: allArguments[AppKeys.fareKey].toString(),
        rate: 0,
        isFav: false,
        start: allArguments[AppKeys.availibilityStartKey],
        end: allArguments[AppKeys.availibilityEndKey],
        nameDescription: allArguments[AppKeys.descriptionKey],
        isSuperHost: false,
        hostModel: HostData(
            profileUrl: user.imageUrl,
            hostBy: '${user.firstName} ${user.lastName}',
            placeType: allArguments[AppKeys.placeTypeKey],
            guests: allArguments[AppKeys.guestCountKey],
            bedRoom: allArguments[AppKeys.bedroomCountKey] ?? 2,
            bed: allArguments[AppKeys.bedsCountKey],
            sharedBath: allArguments[AppKeys.bathroomsCountKey] ?? 3,
            language: ['English'],
            content: 'content',
            responseTime: '1 hour',
            responseRate: 40.5,
            responsePolicy: 'responsePolicy'),
        aboutPlace: 'aboutPlace',
        aboutCountry: 'aboutCountry',
        location: allArguments[AppKeys.targetLatngKey],
        offers: [],
        reviews: [],
        additionServices: [],
        rules: 'rules',
        health: 'health',
        policy: 'policy');

    firebaseDoc.set(obj.toMap()).then((value) {
      Fluttertoast.showToast(
          msg: "Your ad has been posted",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      sendNotificaitonToAllUsers('Alert!', 'Klomi klomi new listing arrive',
          data: obj.toMap());

      debugPrint('your ad has been posted');
    });
  }

  static Future uploadFile(File photo) async {
    String url = "";
    try {
      Reference ref = FirebaseStorage.instance
          .ref("ads")
          .child(photo.path.toString().split("/").last);

      TaskSnapshot task = await ref.putFile(photo);
      url = await task.ref.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
