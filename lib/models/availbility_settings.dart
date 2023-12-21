import 'dart:convert';

import 'house_rules_model.dart';

class AvailbilitySettingsModel {
  int? advanceNoticeInDays;
  HourMinute? sameDayCutoffTime;
  int? preparationTime;
  int? availbilityWindow;
  AvailbilitySettingsModel({
    required this.advanceNoticeInDays,
    required this.sameDayCutoffTime,
    required this.preparationTime,
    required this.availbilityWindow,
  });
  AvailbilitySettingsModel copyWith({
    int? advanceNoticeInDays,
    HourMinute? sameDayCutoffTime,
    int? preparationTime,
    int? availbilityWindow,
  }) {
    return AvailbilitySettingsModel(
      advanceNoticeInDays: advanceNoticeInDays ?? this.advanceNoticeInDays,
      sameDayCutoffTime: sameDayCutoffTime ?? this.sameDayCutoffTime,
      preparationTime: preparationTime ?? this.preparationTime,
      availbilityWindow: availbilityWindow ?? this.availbilityWindow,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (advanceNoticeInDays != null) {
      result.addAll({'advanceNoticeInDays': advanceNoticeInDays});
    }
    if (sameDayCutoffTime != null) {
      result.addAll({'sameDayCutoffTime': sameDayCutoffTime!.toMap()});
    }
    if (preparationTime != null) {
      result.addAll({'preparationTime': preparationTime});
    }
    if (availbilityWindow != null) {
      result.addAll({'availbilityWindow': availbilityWindow});
    }

    return result;
  }

  factory AvailbilitySettingsModel.fromMap(Map<String, dynamic> map) {
    return AvailbilitySettingsModel(
      advanceNoticeInDays: map['advanceNoticeInDays']?.toInt(),
      sameDayCutoffTime: map['sameDayCutoffTime'] != null
          ? HourMinute.fromMap(map['sameDayCutoffTime'])
          : null,
      preparationTime: map['preparationTime']?.toInt(),
      availbilityWindow: map['availbilityWindow']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailbilitySettingsModel.fromJson(String source) =>
      AvailbilitySettingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AvailbilitySettingsModel(advanceNoticeInDays: $advanceNoticeInDays, sameDayCutoffTime: $sameDayCutoffTime, preparationTime: $preparationTime, availbilityWindow: $availbilityWindow)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvailbilitySettingsModel &&
        other.advanceNoticeInDays == advanceNoticeInDays &&
        other.sameDayCutoffTime == sameDayCutoffTime &&
        other.preparationTime == preparationTime &&
        other.availbilityWindow == availbilityWindow;
  }

  @override
  int get hashCode {
    return advanceNoticeInDays.hashCode ^
        sameDayCutoffTime.hashCode ^
        preparationTime.hashCode ^
        availbilityWindow.hashCode;
  }
}
