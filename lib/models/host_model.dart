import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class HostData {
  String hostBy;
  String placeType;
  int guests;
  int bedRoom;
  int bed;
  num sharedBath;
  List language;
  String content;
  String responseTime;
  double responseRate;
  String responsePolicy;
  String profileUrl;
  HostData({
    required this.hostBy,
    required this.placeType,
    required this.guests,
    required this.bedRoom,
    required this.bed,
    required this.sharedBath,
    required this.language,
    required this.content,
    required this.responseTime,
    required this.responseRate,
    required this.responsePolicy,
    required this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'hostBy': hostBy});
    result.addAll({'placeType': placeType});
    result.addAll({'guests': guests});
    result.addAll({'bedRoom': bedRoom});
    result.addAll({'bed': bed});
    result.addAll({'sharedBath': sharedBath});
    result.addAll({'language': language});
    result.addAll({'content': content});
    result.addAll({'responseTime': responseTime});
    result.addAll({'responseRate': responseRate});
    result.addAll({'responsePolicy': responsePolicy});
    result.addAll({'profileUrl': profileUrl});

    return result;
  }

  HostData copyWith({
    String? hostBy,
    String? placeType,
    int? guests,
    int? bedRoom,
    int? bed,
    num? sharedBath,
    List? language,
    String? content,
    String? responseTime,
    double? responseRate,
    String? responsePolicy,
    String? profileUrl,
  }) {
    return HostData(
      hostBy: hostBy ?? this.hostBy,
      placeType: placeType ?? this.placeType,
      guests: guests ?? this.guests,
      bedRoom: bedRoom ?? this.bedRoom,
      bed: bed ?? this.bed,
      sharedBath: sharedBath ?? this.sharedBath,
      language: language ?? this.language,
      content: content ?? this.content,
      responseTime: responseTime ?? this.responseTime,
      responseRate: responseRate ?? this.responseRate,
      responsePolicy: responsePolicy ?? this.responsePolicy,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  factory HostData.fromMap(Map<String, dynamic> map) {
    return HostData(
      hostBy: map['hostBy'] ?? '',
      placeType: map['placeType'] ?? '',
      guests: map['guests']?.toInt() ?? 0,
      bedRoom: map['bedRoom']?.toInt() ?? 0,
      bed: map['bed']?.toInt() ?? 0,
      sharedBath: map['sharedBath'] ?? 0,
      language: List.from(map['language']),
      content: map['content'] ?? '',
      responseTime: map['responseTime'] ?? '',
      responseRate: map['responseRate']?.toDouble() ?? 0.0,
      responsePolicy: map['responsePolicy'] ?? '',
      profileUrl: map['profileUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HostData.fromJson(String source) =>
      HostData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HostData(hostBy: $hostBy, placeType: $placeType, guests: $guests, bedRoom: $bedRoom, bed: $bed, sharedBath: $sharedBath, language: $language, content: $content, responseTime: $responseTime, responseRate: $responseRate, responsePolicy: $responsePolicy, profileUrl: $profileUrl)';
  }

  @override
  int get hashCode {
    return hostBy.hashCode ^
        placeType.hashCode ^
        guests.hashCode ^
        bedRoom.hashCode ^
        bed.hashCode ^
        sharedBath.hashCode ^
        language.hashCode ^
        content.hashCode ^
        responseTime.hashCode ^
        responseRate.hashCode ^
        responsePolicy.hashCode ^
        profileUrl.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HostData &&
        other.hostBy == hostBy &&
        other.placeType == placeType &&
        other.guests == guests &&
        other.bedRoom == bedRoom &&
        other.bed == bed &&
        other.sharedBath == sharedBath &&
        listEquals(other.language, language) &&
        other.content == content &&
        other.responseTime == responseTime &&
        other.responseRate == responseRate &&
        other.responsePolicy == responsePolicy &&
        other.profileUrl == profileUrl;
  }
}
