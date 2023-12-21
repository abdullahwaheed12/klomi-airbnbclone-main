// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

import 'package:klomi/enums/gender.dart';
import 'package:klomi/models/host_setting.dart';
import 'package:klomi/models/house_rules_model.dart';

import '../enums/choose_cancellation_policy.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final DateTime DOB;
  final String email;
  final String phoneNumber;
  final String imageUrl;
  final String uid;
  final String fullName;
  final String messagingToken;
  Gender? gender;
  HostSettings hostSettings;
  HouseRulesModel? houseRulesModel;
  ChoseCancellationPolicy? choseCancellationPolicy;
  num rattings;
  int rattingCount;
  String? idCardPhotoUrl;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.DOB,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
    required this.uid,
    required this.fullName,
    required this.messagingToken,
    this.gender,
    required this.hostSettings,
    this.houseRulesModel,
    this.choseCancellationPolicy,
    required this.rattings,
    required this.rattingCount,
    this.idCardPhotoUrl,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    DateTime? DOB,
    String? email,
    String? phoneNumber,
    String? imageUrl,
    String? uid,
    String? fullName,
    String? messagingToken,
    Gender? gender,
    HostSettings? hostSettings,
    HouseRulesModel? houseRulesModel,
    ChoseCancellationPolicy? choseCancellationPolicy,
    num? rattings,
    int? rattingCount,
    String? idCardPhotoUrl,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      DOB: DOB ?? this.DOB,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      messagingToken: messagingToken ?? this.messagingToken,
      gender: gender ?? this.gender,
      hostSettings: hostSettings ?? this.hostSettings,
      houseRulesModel: houseRulesModel ?? this.houseRulesModel,
      choseCancellationPolicy:
          choseCancellationPolicy ?? this.choseCancellationPolicy,
      rattings: rattings ?? this.rattings,
      rattingCount: rattingCount ?? this.rattingCount,
      idCardPhotoUrl: idCardPhotoUrl ?? this.idCardPhotoUrl,
    );
  }

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, DOB: $DOB, email: $email, phoneNumber: $phoneNumber, imageUrl: $imageUrl, uid: $uid, fullName: $fullName, messagingToken: $messagingToken, gender: $gender, hostSettings: $hostSettings, houseRulesModel: $houseRulesModel, choseCancellationPolicy: $choseCancellationPolicy, rattings: $rattings, rattingCount: $rattingCount, idCardPhotoUrl: $idCardPhotoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.DOB == DOB &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.imageUrl == imageUrl &&
        other.uid == uid &&
        other.fullName == fullName &&
        other.messagingToken == messagingToken &&
        other.gender == gender &&
        other.hostSettings == hostSettings &&
        other.houseRulesModel == houseRulesModel &&
        other.choseCancellationPolicy == choseCancellationPolicy &&
        other.rattings == rattings &&
        other.rattingCount == rattingCount &&
        other.idCardPhotoUrl == idCardPhotoUrl;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        DOB.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        imageUrl.hashCode ^
        uid.hashCode ^
        fullName.hashCode ^
        messagingToken.hashCode ^
        gender.hashCode ^
        hostSettings.hashCode ^
        houseRulesModel.hashCode ^
        choseCancellationPolicy.hashCode ^
        rattings.hashCode ^
        rattingCount.hashCode ^
        idCardPhotoUrl.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'DOB': DOB.millisecondsSinceEpoch});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'uid': uid});
    result.addAll({'fullName': fullName});
    result.addAll({'messagingToken': messagingToken});
    if (gender != null) {
      result.addAll({'gender': gender!.name});
    }
    result.addAll({'hostSettings': hostSettings.toMap()});
    if (houseRulesModel != null) {
      result.addAll({'houseRulesModel': houseRulesModel!.toMap()});
    }
    if (choseCancellationPolicy != null) {
      result.addAll({'choseCancellationPolicy': choseCancellationPolicy!.name});
    }
    result.addAll({'rattings': rattings});
    result.addAll({'rattingCount': rattingCount});
    if (idCardPhotoUrl != null) {
      result.addAll({'idCardPhotoUrl': idCardPhotoUrl});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idCardPhotoUrl: map['idCardPhotoUrl'],
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      DOB: DateTime.fromMillisecondsSinceEpoch(map['DOB']),
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      uid: map['uid'] ?? '',
      fullName: map['fullName'] ?? '',
      messagingToken: map['messagingToken'] ?? '',
      gender:
          map['gender'] != null ? Gender.values.byName(map['gender']) : null,
      hostSettings: HostSettings.fromMap(map['hostSettings']),
      houseRulesModel: map['houseRulesModel'] != null
          ? HouseRulesModel.fromMap(map['houseRulesModel'])
          : null,
      choseCancellationPolicy: map['choseCancellationPolicy'] != null
          ? ChoseCancellationPolicy.values
              .byName(map['choseCancellationPolicy'])
          : null,
      rattings: map['rattings'] ?? 0,
      rattingCount: map['rattingCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
