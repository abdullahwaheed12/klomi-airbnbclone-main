// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SaftyItems {
  bool isSmokeAlarm = false;
  bool isFirstAidKit = false;
  bool isFireExtinguisher = false;
  bool isCarbonMonoxideAlarm = false;
  SaftyItems({
    this.isSmokeAlarm = false,
    this.isFirstAidKit = false,
    this.isFireExtinguisher = false,
    this.isCarbonMonoxideAlarm = false,
  });

  SaftyItems copyWith({
    bool? isSmokeAlarm,
    bool? isFirstAidKit,
    bool? isFireExtinguisher,
    bool? isCarbonMonoxideAlarm,
  }) {
    return SaftyItems(
      isSmokeAlarm: isSmokeAlarm ?? this.isSmokeAlarm,
      isFirstAidKit: isFirstAidKit ?? this.isFirstAidKit,
      isFireExtinguisher: isFireExtinguisher ?? this.isFireExtinguisher,
      isCarbonMonoxideAlarm:
          isCarbonMonoxideAlarm ?? this.isCarbonMonoxideAlarm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSmokeAlarm': isSmokeAlarm,
      'isFirstAidKit': isFirstAidKit,
      'isFireExtinguisher': isFireExtinguisher,
      'isCarbonMonoxideAlarm': isCarbonMonoxideAlarm,
    };
  }

  factory SaftyItems.fromMap(Map<String, dynamic> map) {
    return SaftyItems(
      isSmokeAlarm: (map["isSmokeAlarm"] ?? false) as bool,
      isFirstAidKit: (map["isFirstAidKit"] ?? false) as bool,
      isFireExtinguisher: (map["isFireExtinguisher"] ?? false) as bool,
      isCarbonMonoxideAlarm: (map["isCarbonMonoxideAlarm"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaftyItems.fromJson(String source) =>
      SaftyItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SaftyItems(isSmokeAlarm: $isSmokeAlarm, isFirstAidKit: $isFirstAidKit, isFireExtinguisher: $isFireExtinguisher, isCarbonMonoxideAlarm: $isCarbonMonoxideAlarm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaftyItems &&
        other.isSmokeAlarm == isSmokeAlarm &&
        other.isFirstAidKit == isFirstAidKit &&
        other.isFireExtinguisher == isFireExtinguisher &&
        other.isCarbonMonoxideAlarm == isCarbonMonoxideAlarm;
  }

  @override
  int get hashCode {
    return isSmokeAlarm.hashCode ^
        isFirstAidKit.hashCode ^
        isFireExtinguisher.hashCode ^
        isCarbonMonoxideAlarm.hashCode;
  }
}
