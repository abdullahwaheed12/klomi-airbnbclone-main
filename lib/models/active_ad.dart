// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:klomi/models/explore_model.dart';

import '../enums/active_order_num.dart';

class ActiveAd {
  final String visitorId;
  final String hostId;
  final ExploreModel exploreModel;
  final ActiveOrderStatus activeOrderStatus;
  final String visitorName;
  final String visitorPhotoUrl;
  final double serviceFee;
  final int days;
  const ActiveAd({
    required this.visitorId,
    required this.hostId,
    required this.exploreModel,
    required this.activeOrderStatus,
    required this.visitorName,
    required this.visitorPhotoUrl,
    required this.serviceFee,
    required this.days,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'visitorId': visitorId});
    result.addAll({'exploreModel': exploreModel.toMap()});
    result.addAll({'activeOrderStatus': activeOrderStatus.name});
    result.addAll({'hostId': hostId});
    result.addAll({'visitorName': visitorName});
    result.addAll({'visitorPhotoUrl': visitorPhotoUrl});
    result.addAll({'serviceFee': serviceFee});
    result.addAll({'days': days});
    return result;
  }

  factory ActiveAd.fromMap(Map<String, dynamic> map) {
    return ActiveAd(
      days: map['days'],
      serviceFee: map['serviceFee'],
      visitorPhotoUrl: map['visitorPhotoUrl'],
      visitorName: map['visitorName'] ?? 'abdullah',
      hostId: map['hostId'],
      visitorId: map['visitorId'] ?? '',
      exploreModel: ExploreModel.fromMap(map['exploreModel']),
      activeOrderStatus:
          ActiveOrderStatus.values.byName(map['activeOrderStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActiveAd.fromJson(String source) =>
      ActiveAd.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActiveAd(visitorId: $visitorId, hostId: $hostId, exploreModel: $exploreModel, activeOrderStatus: $activeOrderStatus, visitorName: $visitorName, visitorPhotoUrl: $visitorPhotoUrl, serviceFee: $serviceFee, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActiveAd &&
        other.visitorId == visitorId &&
        other.hostId == hostId &&
        other.exploreModel == exploreModel &&
        other.activeOrderStatus == activeOrderStatus &&
        other.visitorName == visitorName &&
        other.visitorPhotoUrl == visitorPhotoUrl &&
        other.serviceFee == serviceFee &&
        other.days == days;
  }

  @override
  int get hashCode {
    return visitorId.hashCode ^
        hostId.hashCode ^
        exploreModel.hashCode ^
        activeOrderStatus.hashCode ^
        visitorName.hashCode ^
        visitorPhotoUrl.hashCode ^
        serviceFee.hashCode ^
        days.hashCode;
  }

  ActiveAd copyWith({
    String? visitorId,
    String? hostId,
    ExploreModel? exploreModel,
    ActiveOrderStatus? activeOrderStatus,
    String? visitorName,
    String? visitorPhotoUrl,
    double? serviceFee,
    int? days,
  }) {
    return ActiveAd(
      visitorId: visitorId ?? this.visitorId,
      hostId: hostId ?? this.hostId,
      exploreModel: exploreModel ?? this.exploreModel,
      activeOrderStatus: activeOrderStatus ?? this.activeOrderStatus,
      visitorName: visitorName ?? this.visitorName,
      visitorPhotoUrl: visitorPhotoUrl ?? this.visitorPhotoUrl,
      serviceFee: serviceFee ?? this.serviceFee,
      days: days ?? this.days,
    );
  }
}
