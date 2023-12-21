import 'package:klomi/enums/best_describe_your_place_enum.dart';
import 'package:klomi/models/explore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../models/animities.dart';
import '../models/host_model.dart';
import '../views/allViews/all_views.dart';

class AdController extends GetxController {
  List<ExploreModel>? adpostModel;
  var _completeList = <ExploreModel>[];
  fetchAds() async {
    var post = await FirebaseFirestore.instance.collection('posts').get();
    if (post.docs.isEmpty) {
      adpostModel = [];
    } else {
      adpostModel =
          post.docs.map((e) => ExploreModel.fromMap(e.data())).toList();
      _completeList = adpostModel!;
    }
    update();
  }

  //------filter
  bool isFilter = false;
  Animities animities = Animities();
  bool isAminitiesExpand = false;
  //--
  bool isEnglish = false;
  bool isFrench = false;
  bool isGerman = false;
  //--
  bool isSuperHost = false;
  bool isklomiPlus = false;
  //--
  bool isAccessibilityExpand = false;
  bool isStepFreePath = false;
  bool isEntranceWiderThen32 = false;
  bool isStepFreeGuest = false;
  //--
  bool isInstant = false;
  bool isSelfCheckIn = false;
  //--
  bool isHouse = false;
  bool isAppartment = false;
  bool isGuestHouse = false;
  bool isHotel = false;
  //--
  int? bedroomCount;
  int? bedsCount;
  int? bathRoomsCount;
  //--
  bool isEntirePlace = false;
  bool isPrivateRoom = false;
  bool isSharedRoom = false;
  //--
  final TextEditingController minimumPriceController =
      TextEditingController(text: "\$10.0");
  final TextEditingController maximumPriceController =
      TextEditingController(text: "\$30.0");
  final double min = 1.0;
  final double max = 100.0;
  clearFilter() {
    Get.offAll(const AllViews());
    isFilter = false;
    adpostModel = _completeList;
  }

  fetchFilterAds() async {
    isFilter = true;
    var minimumPrice = double.parse(minimumPriceController.text.split('\$')[1]);
    var maximumPrice = double.parse(maximumPriceController.text.split('\$')[1]);

    var posts = _completeList;
    if (posts.isEmpty) {
      adpostModel = [];
    } else {
      var filterList = <ExploreModel>[];
      for (var post in posts) {
        if (double.parse(post.price) < maximumPrice &&
            double.parse(post.price) > minimumPrice) {
          if (checkAminities(post.animities) &&
              checkRoomsAndBeds(post.hostModel) &&
              typeOfPlaceCheck(post.hostModel) &&
              propertyType(post)) {
            filterList.add(post);
          }
        }
      }
      adpostModel = filterList;
    }
    Get.offAll(const AllViews());
    update();
  }

  bool checkRoomsAndBeds(HostData hostData) {
    //--
    bool thisItemCheck(int? count, int hostData) {
      var isCheck = true;
      if (count != null) {
        if (count <= hostData) {
          isCheck = true;
        } else {
          isCheck = false;
        }
      }
      return isCheck;
    }

    //--
    var isCheck = true;

    if (thisItemCheck(bathRoomsCount, hostData.sharedBath.toInt()) &&
        thisItemCheck(bedroomCount, hostData.bedRoom.toInt()) &&
        thisItemCheck(bedsCount, hostData.bed.toInt())) {
      isCheck = true;
    } else {
      isCheck = false;
    }

    return isCheck;
  }

  bool typeOfPlaceCheck(HostData hostData) {
    bool thisItemCheck(bool type, String placeType1, String placeType2) {
      var isCheck = true;
      if (type) {
        if (placeType1 == placeType2) {
          isCheck = true;
        } else {
          isCheck = false;
        }
      }
      return isCheck;
    }

    //--
    var isCheck = true;
    if (thisItemCheck(isEntirePlace, hostData.placeType, 'entireRoom'.tr()) &&
        thisItemCheck(isPrivateRoom, hostData.placeType, 'privateRoom'.tr()) &&
        thisItemCheck(isSharedRoom, hostData.placeType, 'sharedRoom'.tr())) {
      isCheck = true;
    } else {
      isCheck = false;
    }
    return isCheck;
  }

  bool checkAminities(Animities animi) {
    bool thisItemcheck(bool animitie1, bool animitie2) {
      var isCheck = true;
      if (animitie1) {
        if (animitie2) {
          isCheck = true;
        } else {
          isCheck = false;
        }
      }
      return isCheck;
    }

    var isCheck = true;
    if (thisItemcheck(
            animities.isDedicatedWorkspace, animi.isDedicatedWorkspace) &&
        thisItemcheck(animities.isFreeParking, animi.isFreeParking) &&
        thisItemcheck(animities.isKitchen, animi.isKitchen) &&
        thisItemcheck(animities.isPaidParking, animi.isPaidParking) &&
        thisItemcheck(animities.isTv, animi.isTv) &&
        thisItemcheck(animities.isWasher, animi.isWasher) &&
        thisItemcheck(animities.isWifi, animi.isWifi) &&
        thisItemcheck(animities.isAirConditioning, animi.isAirConditioning)) {
      isCheck = true;
    } else {
      isCheck = false;
    }
    return isCheck;
  }

  bool propertyType(ExploreModel exploreModel) {
    bool thisItemCheck(bool type, BestDescribeYourPlaceEnum enum1,
        BestDescribeYourPlaceEnum enum2) {
      var isCheck = true;
      if (type) {
        if (enum1 == enum2) {
          isCheck = true;
        } else {
          isCheck = false;
        }
      }
      return isCheck;
    }

    var isCheck = true;
    if (thisItemCheck(isHouse, exploreModel.bestDescribeYourPlaceEnum,
            BestDescribeYourPlaceEnum.house) &&
        thisItemCheck(isAppartment, exploreModel.bestDescribeYourPlaceEnum,
            BestDescribeYourPlaceEnum.apartment) &&
        thisItemCheck(isGuestHouse, exploreModel.bestDescribeYourPlaceEnum,
            BestDescribeYourPlaceEnum.guesthouse) &&
        thisItemCheck(isHotel, exploreModel.bestDescribeYourPlaceEnum,
            BestDescribeYourPlaceEnum.hotel)) {
      isCheck = true;
    } else {
      isCheck = false;
    }
    return isCheck;
  }
}
