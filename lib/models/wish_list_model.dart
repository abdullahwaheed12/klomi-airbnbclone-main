// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WishListModel {
  final String wishUserId;
  final String wishAdId;
  const WishListModel({
    required this.wishUserId,
    required this.wishAdId,
  });

  WishListModel copyWith({
    String? wishUserId,
    String? wishAdId,
  }) {
    return WishListModel(
      wishUserId: wishUserId ?? this.wishUserId,
      wishAdId: wishAdId ?? this.wishAdId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wishUser': wishUserId,
      'wishad': wishAdId,
    };
  }

  factory WishListModel.fromMap(Map<String, dynamic> map) {
    return WishListModel(
      wishUserId: (map["wishUser"] ?? '') as String,
      wishAdId: (map["wishad"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WishListModel.fromJson(String source) =>
      WishListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WishListModel(wishUserId: $wishUserId, wishAdId: $wishAdId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WishListModel &&
        other.wishUserId == wishUserId &&
        other.wishAdId == wishAdId;
  }

  @override
  int get hashCode => wishUserId.hashCode ^ wishAdId.hashCode;
}
