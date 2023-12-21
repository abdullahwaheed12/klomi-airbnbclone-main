import 'dart:convert';

class HouseRulesModel {
  bool? isPetAllowed;
  bool? isEventAllowed;
  bool? isSmookingAllowed;
  bool? isSetQuithours;
  bool? isCommercialPhotoGraphyAllowed;
  HourMinute quitFrom;
  HourMinute quitTo;
  HouseRulesModel({
    this.isPetAllowed = false,
    this.isEventAllowed = false,
    this.isSmookingAllowed = false,
    this.isSetQuithours = false,
    this.isCommercialPhotoGraphyAllowed = false,
    required this.quitFrom,
    required this.quitTo,
  });

  HouseRulesModel copyWith({
    bool? isPetAllowed,
    bool? isEventAllowed,
    bool? isSmookingAllowed,
    bool? isSetQuithours,
    bool? isCommercialPhotoGraphyAllowed,
    HourMinute? quitFrom,
    HourMinute? quitTo,
  }) {
    return HouseRulesModel(
      isPetAllowed: isPetAllowed ?? this.isPetAllowed,
      isEventAllowed: isEventAllowed ?? this.isEventAllowed,
      isSmookingAllowed: isSmookingAllowed ?? this.isSmookingAllowed,
      isSetQuithours: isSetQuithours ?? this.isSetQuithours,
      isCommercialPhotoGraphyAllowed:
          isCommercialPhotoGraphyAllowed ?? this.isCommercialPhotoGraphyAllowed,
      quitFrom: quitFrom ?? this.quitFrom,
      quitTo: quitTo ?? this.quitTo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (isPetAllowed != null) {
      result.addAll({'isPetAllowed': isPetAllowed});
    }
    if (isEventAllowed != null) {
      result.addAll({'isEventAllowed': isEventAllowed});
    }
    if (isSmookingAllowed != null) {
      result.addAll({'isSmookingAllowed': isSmookingAllowed});
    }
    if (isSetQuithours != null) {
      result.addAll({'isSetQuithours': isSetQuithours});
    }
    if (isCommercialPhotoGraphyAllowed != null) {
      result.addAll(
          {'isCommercialPhotoGraphyAllowed': isCommercialPhotoGraphyAllowed});
    }
    result.addAll({'quitFrom': quitFrom.toMap()});
    result.addAll({'quitTo': quitTo.toMap()});

    return result;
  }

  factory HouseRulesModel.fromMap(Map<String, dynamic> map) {
    return HouseRulesModel(
      isPetAllowed: map['isPetAllowed'],
      isEventAllowed: map['isEventAllowed'],
      isSmookingAllowed: map['isSmookingAllowed'],
      isSetQuithours: map['isSetQuithours'],
      isCommercialPhotoGraphyAllowed: map['isCommercialPhotoGraphyAllowed'],
      quitFrom: HourMinute.fromMap(map['quitFrom']),
      quitTo: HourMinute.fromMap(map['quitTo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HouseRulesModel.fromJson(String source) =>
      HouseRulesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HouseRulesModel(isPetAllowed: $isPetAllowed, isEventAllowed: $isEventAllowed, isSmookingAllowed: $isSmookingAllowed, isSetQuithours: $isSetQuithours, isCommercialPhotoGraphyAllowed: $isCommercialPhotoGraphyAllowed, quitFrom: $quitFrom, quitTo: $quitTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HouseRulesModel &&
        other.isPetAllowed == isPetAllowed &&
        other.isEventAllowed == isEventAllowed &&
        other.isSmookingAllowed == isSmookingAllowed &&
        other.isSetQuithours == isSetQuithours &&
        other.isCommercialPhotoGraphyAllowed ==
            isCommercialPhotoGraphyAllowed &&
        other.quitFrom == quitFrom &&
        other.quitTo == quitTo;
  }

  @override
  int get hashCode {
    return isPetAllowed.hashCode ^
        isEventAllowed.hashCode ^
        isSmookingAllowed.hashCode ^
        isSetQuithours.hashCode ^
        isCommercialPhotoGraphyAllowed.hashCode ^
        quitFrom.hashCode ^
        quitTo.hashCode;
  }
}

//--------
class HourMinute {
  int minute;
  int hour;
  HourMinute({
    this.minute = 00,
    required this.hour,
  });

  HourMinute copyWith({
    int? minute,
    int? hour,
  }) {
    return HourMinute(
      minute: minute ?? this.minute,
      hour: hour ?? this.hour,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'minute': minute});
    result.addAll({'hour': hour});

    return result;
  }

  factory HourMinute.fromMap(Map<String, dynamic> map) {
    return HourMinute(
      minute: map['minute']?.toInt() ?? 0,
      hour: map['hour']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourMinute.fromJson(String source) =>
      HourMinute.fromMap(json.decode(source));

  @override
  String toString() => 'HourMinute(minute: $minute, hour: $hour)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HourMinute && other.minute == minute && other.hour == hour;
  }

  @override
  int get hashCode => minute.hashCode ^ hour.hashCode;
}
