// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:klomi/models/additional_chargers.dart';
import 'package:klomi/models/animities.dart';
import 'package:klomi/models/host_model.dart';
import 'package:klomi/models/offers.dart';
import 'package:klomi/models/reviews_model.dart';
import 'package:klomi/models/safty_alarm_items.dart';
import 'package:klomi/models/scnic_views.dart';
import 'package:klomi/models/services.dart';
import 'package:klomi/models/standout_animities_model.dart';
import 'package:klomi/models/trip_length.dart';
import 'package:klomi/models/wifi_model.dart';

import '../enums/ad_listing_status.dart';
import '../enums/best_describe_your_place_enum.dart';
import 'availbility_settings.dart';

class ExploreModel {
  final List images;
  final String title;
  final String distance;
  final String availableTime;
  String price;
  final double rate;
  bool isFav;
  final String nameDescription;
  final bool isSuperHost;
  final HostData hostModel;
  final String aboutPlace;
  final String aboutCountry;
  GeoPoint location;
  final List<Offers> offers;
  final List<ReviewsModel> reviews;
  final List<Services> additionServices;
  final String rules;
  final String health;
  final String policy;
  final String adId;
  final String hostId;
  DateTime start;
  DateTime end;
  List<DateTime> selectedDates;
  final StandoutAmenitieModel standoutAmenities;
  final SaftyItems saftyItems;
  final BestDescribeYourPlaceEnum bestDescribeYourPlaceEnum;
  Animities animities;
  final AdListingStatus adListingStatus;
  String direction;
  WifiModel? wiFi;
  SenicView? senicView;
  String houseManual;
  AdditionalCharges? additionalCharges;
  AvailbilitySettingsModel? availbilitySettingsModel;
  TripLengthModel? tripLengthModel;
  bool isActive;
  bool isListed;

  ExploreModel({
    required this.images,
    required this.title,
    required this.distance,
    required this.availableTime,
    required this.price,
    required this.rate,
    required this.isFav,
    required this.nameDescription,
    required this.isSuperHost,
    required this.hostModel,
    required this.aboutPlace,
    required this.aboutCountry,
    required this.location,
    required this.offers,
    required this.reviews,
    required this.additionServices,
    required this.rules,
    required this.health,
    required this.policy,
    required this.adId,
    required this.hostId,
    required this.start,
    required this.end,
    required this.selectedDates,
    required this.standoutAmenities,
    required this.saftyItems,
    required this.bestDescribeYourPlaceEnum,
    required this.animities,
    required this.adListingStatus,
    required this.direction,
    this.wiFi,
    this.senicView,
    required this.houseManual,
    this.additionalCharges,
    this.availbilitySettingsModel,
    this.tripLengthModel,
    required this.isActive,
    required this.isListed,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExploreModel &&
        listEquals(other.images, images) &&
        other.title == title &&
        other.distance == distance &&
        other.availableTime == availableTime &&
        other.price == price &&
        other.rate == rate &&
        other.isFav == isFav &&
        other.nameDescription == nameDescription &&
        other.isSuperHost == isSuperHost &&
        other.hostModel == hostModel &&
        other.aboutPlace == aboutPlace &&
        other.aboutCountry == aboutCountry &&
        other.location == location &&
        listEquals(other.offers, offers) &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.additionServices, additionServices) &&
        other.rules == rules &&
        other.health == health &&
        other.policy == policy &&
        other.adId == adId &&
        other.hostId == hostId &&
        other.start == start &&
        other.end == end &&
        listEquals(other.selectedDates, selectedDates) &&
        other.standoutAmenities == standoutAmenities &&
        other.saftyItems == saftyItems &&
        other.bestDescribeYourPlaceEnum == bestDescribeYourPlaceEnum &&
        other.animities == animities &&
        other.adListingStatus == adListingStatus &&
        other.direction == direction &&
        other.wiFi == wiFi &&
        other.senicView == senicView &&
        other.houseManual == houseManual &&
        other.additionalCharges == additionalCharges &&
        other.availbilitySettingsModel == availbilitySettingsModel &&
        other.tripLengthModel == tripLengthModel &&
        other.isActive == isActive &&
        other.isListed == isListed;
  }

  @override
  int get hashCode {
    return images.hashCode ^
        title.hashCode ^
        distance.hashCode ^
        availableTime.hashCode ^
        price.hashCode ^
        rate.hashCode ^
        isFav.hashCode ^
        nameDescription.hashCode ^
        isSuperHost.hashCode ^
        hostModel.hashCode ^
        aboutPlace.hashCode ^
        aboutCountry.hashCode ^
        location.hashCode ^
        offers.hashCode ^
        reviews.hashCode ^
        additionServices.hashCode ^
        rules.hashCode ^
        health.hashCode ^
        policy.hashCode ^
        adId.hashCode ^
        hostId.hashCode ^
        start.hashCode ^
        end.hashCode ^
        selectedDates.hashCode ^
        standoutAmenities.hashCode ^
        saftyItems.hashCode ^
        bestDescribeYourPlaceEnum.hashCode ^
        animities.hashCode ^
        adListingStatus.hashCode ^
        direction.hashCode ^
        wiFi.hashCode ^
        senicView.hashCode ^
        houseManual.hashCode ^
        additionalCharges.hashCode ^
        availbilitySettingsModel.hashCode ^
        tripLengthModel.hashCode ^
        isActive.hashCode ^
        isListed.hashCode;
  }

  @override
  String toString() {
    return 'ExploreModel(images: $images, title: $title, distance: $distance, availableTime: $availableTime, price: $price, rate: $rate, isFav: $isFav, nameDescription: $nameDescription, isSuperHost: $isSuperHost, hostModel: $hostModel, aboutPlace: $aboutPlace, aboutCountry: $aboutCountry, location: $location, offers: $offers, reviews: $reviews, additionServices: $additionServices, rules: $rules, health: $health, policy: $policy, adId: $adId, hostId: $hostId, start: $start, end: $end, selectedDates: $selectedDates, standoutAmenities: $standoutAmenities, saftyItems: $saftyItems, bestDescribeYourPlaceEnum: $bestDescribeYourPlaceEnum, animities: $animities, adListingStatus: $adListingStatus, direction: $direction, wiFi: $wiFi, senicView: $senicView, houseManual: $houseManual, additionalCharges: $additionalCharges, availbilitySettingsModel: $availbilitySettingsModel, tripLengthModel: $tripLengthModel, isActive: $isActive, isListed: $isListed)';
  }

  ExploreModel copyWith({
    List? images,
    String? title,
    String? distance,
    String? availableTime,
    String? price,
    double? rate,
    bool? isFav,
    String? nameDescription,
    bool? isSuperHost,
    HostData? hostModel,
    String? aboutPlace,
    String? aboutCountry,
    GeoPoint? location,
    List<Offers>? offers,
    List<ReviewsModel>? reviews,
    List<Services>? additionServices,
    String? rules,
    String? health,
    String? policy,
    String? adId,
    String? hostId,
    DateTime? start,
    DateTime? end,
    List<DateTime>? selectedDates,
    StandoutAmenitieModel? standoutAmenities,
    SaftyItems? saftyItems,
    BestDescribeYourPlaceEnum? bestDescribeYourPlaceEnum,
    Animities? animities,
    AdListingStatus? adListingStatus,
    String? direction,
    WifiModel? wiFi,
    SenicView? senicView,
    String? houseManual,
    AdditionalCharges? additionalCharges,
    AvailbilitySettingsModel? availbilitySettingsModel,
    TripLengthModel? tripLengthModel,
    bool? isActive,
    bool? isListed,
  }) {
    return ExploreModel(
      images: images ?? this.images,
      title: title ?? this.title,
      distance: distance ?? this.distance,
      availableTime: availableTime ?? this.availableTime,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      isFav: isFav ?? this.isFav,
      nameDescription: nameDescription ?? this.nameDescription,
      isSuperHost: isSuperHost ?? this.isSuperHost,
      hostModel: hostModel ?? this.hostModel,
      aboutPlace: aboutPlace ?? this.aboutPlace,
      aboutCountry: aboutCountry ?? this.aboutCountry,
      location: location ?? this.location,
      offers: offers ?? this.offers,
      reviews: reviews ?? this.reviews,
      additionServices: additionServices ?? this.additionServices,
      rules: rules ?? this.rules,
      health: health ?? this.health,
      policy: policy ?? this.policy,
      adId: adId ?? this.adId,
      hostId: hostId ?? this.hostId,
      start: start ?? this.start,
      end: end ?? this.end,
      selectedDates: selectedDates ?? this.selectedDates,
      standoutAmenities: standoutAmenities ?? this.standoutAmenities,
      saftyItems: saftyItems ?? this.saftyItems,
      bestDescribeYourPlaceEnum:
          bestDescribeYourPlaceEnum ?? this.bestDescribeYourPlaceEnum,
      animities: animities ?? this.animities,
      adListingStatus: adListingStatus ?? this.adListingStatus,
      direction: direction ?? this.direction,
      wiFi: wiFi ?? this.wiFi,
      senicView: senicView ?? this.senicView,
      houseManual: houseManual ?? this.houseManual,
      additionalCharges: additionalCharges ?? this.additionalCharges,
      availbilitySettingsModel:
          availbilitySettingsModel ?? this.availbilitySettingsModel,
      tripLengthModel: tripLengthModel ?? this.tripLengthModel,
      isActive: isActive ?? this.isActive,
      isListed: isListed ?? this.isListed,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'images': images});
    result.addAll({'title': title});
    result.addAll({'distance': distance});
    result.addAll({'availableTime': availableTime});
    result.addAll({'price': price});
    result.addAll({'rate': rate});
    result.addAll({'isFav': isFav});
    result.addAll({'isActive': isActive});
    result.addAll({'isListed': isListed});
    result.addAll({'nameDescription': nameDescription});
    result.addAll({'isSuperHost': isSuperHost});
    result.addAll({'hostModel': hostModel.toMap()});
    result.addAll({'aboutPlace': aboutPlace});
    result.addAll({'aboutCountry': aboutCountry});
    result.addAll({'location': location});
    result.addAll({'offers': offers.map((x) => x.toMap()).toList()});
    result.addAll({'reviews': reviews.map((x) => x.toMap()).toList()});
    result.addAll(
        {'additionServices': additionServices.map((x) => x.toMap()).toList()});
    result.addAll({'rules': rules});
    result.addAll({'health': health});
    result.addAll({'policy': policy});
    result.addAll({'adId': adId});
    result.addAll({'hostId': hostId});
    result.addAll({'start': start.millisecondsSinceEpoch});
    result.addAll({'end': end.millisecondsSinceEpoch});
    result.addAll({
      'selectedDates':
          selectedDates.map((x) => x.millisecondsSinceEpoch).toList()
    });
    result.addAll({'standoutAmenities': standoutAmenities.toMap()});
    result.addAll({'saftyItems': saftyItems.toMap()});
    result
        .addAll({'bestDescribeYourPlaceEnum': bestDescribeYourPlaceEnum.name});
    result.addAll({'animities': animities.toMap()});
    result.addAll({'adListingStatus': adListingStatus.name});
    result.addAll({'direction': direction});
    if (wiFi != null) {
      result.addAll({'wiFi': wiFi!.toMap()});
    }
    if (senicView != null) {
      result.addAll({'senicView': senicView!.toMap()});
    }
    result.addAll({'houseManual': houseManual});
    if (additionalCharges != null) {
      result.addAll({'additionalCharges': additionalCharges!.toMap()});
    }
    if (availbilitySettingsModel != null) {
      result.addAll(
          {'availbilitySettingsModel': availbilitySettingsModel!.toMap()});
    }
    if (tripLengthModel != null) {
      result.addAll({'tripLengthModel': tripLengthModel!.toMap()});
    }

    return result;
  }

  factory ExploreModel.fromMap(Map<String, dynamic> map) {
    return ExploreModel(
      saftyItems: SaftyItems.fromMap(map['saftyItems']),
      images: List.from(map['images']),
      title: map['title'] ?? '',
      distance: map['distance'] ?? '',
      availableTime: map['availableTime'] ?? '',
      price: map['price'] ?? '',
      rate: map['rate']?.toDouble() ?? 0.0,
      isFav: map['isFav'] ?? false,
      isListed: map['isListed'] ?? true,
      nameDescription: map['nameDescription'] ?? '',
      isSuperHost: map['isSuperHost'] ?? false,
      isActive: map['isActive'] ?? true,
      hostModel: HostData.fromMap(map['hostModel']),
      aboutPlace: map['aboutPlace'] ?? '',
      aboutCountry: map['aboutCountry'] ?? '',
      location: map['location'],
      offers: List<Offers>.from(map['offers']?.map((x) => Offers.fromMap(x))),
      reviews: List<ReviewsModel>.from(
          map['reviews']?.map((x) => ReviewsModel.fromMap(x))),
      additionServices: List<Services>.from(
          map['additionServices']?.map((x) => Services.fromMap(x))),
      rules: map['rules'] ?? '',
      health: map['health'] ?? '',
      policy: map['policy'] ?? '',
      adId: map['adId'] ?? '',
      hostId: map['hostId'] ?? '',
      start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      end: DateTime.fromMillisecondsSinceEpoch(map['end']),
      selectedDates: List<DateTime>.from(map['selectedDates']
          ?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))),
      standoutAmenities:
          StandoutAmenitieModel.fromMap(map['standoutAmenities']),
      bestDescribeYourPlaceEnum: BestDescribeYourPlaceEnum.values
          .byName(map['bestDescribeYourPlaceEnum']),
      animities: Animities.fromMap(map['animities']),
      adListingStatus: AdListingStatus.values
          .byName(map['adListingStatus'] ?? AdListingStatus.pending.name),
      direction: map['direction'] ?? '',
      wiFi: map['wiFi'] != null ? WifiModel.fromMap(map['wiFi']) : null,
      senicView:
          map['senicView'] != null ? SenicView.fromMap(map['senicView']) : null,
      houseManual: map['houseManual'] ?? '',
      additionalCharges: map['additionalCharges'] != null
          ? AdditionalCharges.fromMap(map['additionalCharges'])
          : null,
      availbilitySettingsModel: map['availbilitySettingsModel'] != null
          ? AvailbilitySettingsModel.fromMap(map['availbilitySettingsModel'])
          : null,
      tripLengthModel: map['tripLengthModel'] != null
          ? TripLengthModel.fromMap(map['tripLengthModel'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExploreModel.fromJson(String source) =>
      ExploreModel.fromMap(json.decode(source));
}
