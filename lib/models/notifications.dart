import 'dart:convert';

import 'package:klomi/enums/active_order_num.dart';

class NotificationsModel {
  String body;
  String imageUrl;
  ActiveOrderStatus activeOrderStatus;
  DateTime dateTime;
  bool isHost;
  String receiverUid;
  NotificationsModel({
    required this.body,
    required this.imageUrl,
    required this.activeOrderStatus,
    required this.dateTime,
    required this.isHost,
    required this.receiverUid,
  });

  NotificationsModel copyWith({
    String? body,
    String? imageUrl,
    ActiveOrderStatus? activeOrderStatus,
    DateTime? dateTime,
    bool? isHost,
    String? receiverUid,
  }) {
    return NotificationsModel(
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      activeOrderStatus: activeOrderStatus ?? this.activeOrderStatus,
      dateTime: dateTime ?? this.dateTime,
      isHost: isHost ?? this.isHost,
      receiverUid: receiverUid ?? this.receiverUid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'body': body});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'activeOrderStatus': activeOrderStatus.name});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'isHost': isHost});
    result.addAll({'receiverUid': receiverUid});

    return result;
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      body: map['body'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      activeOrderStatus:
          ActiveOrderStatus.values.byName(map['activeOrderStatus']),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      isHost: map['isHost'] ?? false,
      receiverUid: map['receiverUid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromJson(String source) =>
      NotificationsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationsModel(body: $body, imageUrl: $imageUrl, activeOrderStatus: $activeOrderStatus, dateTime: $dateTime, isHost: $isHost, receiverUid: $receiverUid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationsModel &&
        other.body == body &&
        other.imageUrl == imageUrl &&
        other.activeOrderStatus == activeOrderStatus &&
        other.dateTime == dateTime &&
        other.isHost == isHost &&
        other.receiverUid == receiverUid;
  }

  @override
  int get hashCode {
    return body.hashCode ^
        imageUrl.hashCode ^
        activeOrderStatus.hashCode ^
        dateTime.hashCode ^
        isHost.hashCode ^
        receiverUid.hashCode;
  }
}
