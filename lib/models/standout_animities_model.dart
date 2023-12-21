// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StandoutAmenitieModel {
  bool isPool = false;
  bool isPiano = false;
  bool isHotTub = false;
  bool isPatio = false;
  bool isBBQGrill = false;
  bool outdoorDiningArea = false;
  bool isBeach = false;
  bool isExerciseEquipment = false;
  bool isFirePit = false;
  bool isInDoorFirePlace = false;
  bool isLakeAccess = false;
  bool isOutdoorShower = false;
  bool isOutdoordiningArea = false;
  bool isPoolTable = false;
  bool isSkiIn = false;
  StandoutAmenitieModel({
    this.isPool = false,
    this.isPiano = false,
    this.isHotTub = false,
    this.isPatio = false,
    this.isBBQGrill = false,
    this.outdoorDiningArea = false,
    this.isBeach = false,
    this.isExerciseEquipment = false,
    this.isFirePit = false,
    this.isInDoorFirePlace = false,
    this.isLakeAccess = false,
    this.isOutdoorShower = false,
    this.isOutdoordiningArea = false,
    this.isPoolTable = false,
    this.isSkiIn = false,
  });

  StandoutAmenitieModel copyWith({
    bool? isPool,
    bool? isPiano,
    bool? isHotTub,
    bool? isPatio,
    bool? isBBQGrill,
    bool? outdoorDiningArea,
    bool? isBeach,
    bool? isExerciseEquipment,
    bool? isFirePit,
    bool? isInDoorFirePlace,
    bool? isLakeAccess,
    bool? isOutdoorShower,
    bool? isOutdoordiningArea,
    bool? isPoolTable,
    bool? isSkiIn,
  }) {
    return StandoutAmenitieModel(
      isPool: isPool ?? this.isPool,
      isPiano: isPiano ?? this.isPiano,
      isHotTub: isHotTub ?? this.isHotTub,
      isPatio: isPatio ?? this.isPatio,
      isBBQGrill: isBBQGrill ?? this.isBBQGrill,
      outdoorDiningArea: outdoorDiningArea ?? this.outdoorDiningArea,
      isBeach: isBeach ?? this.isBeach,
      isExerciseEquipment: isExerciseEquipment ?? this.isExerciseEquipment,
      isFirePit: isFirePit ?? this.isFirePit,
      isInDoorFirePlace: isInDoorFirePlace ?? this.isInDoorFirePlace,
      isLakeAccess: isLakeAccess ?? this.isLakeAccess,
      isOutdoorShower: isOutdoorShower ?? this.isOutdoorShower,
      isOutdoordiningArea: isOutdoordiningArea ?? this.isOutdoordiningArea,
      isPoolTable: isPoolTable ?? this.isPoolTable,
      isSkiIn: isSkiIn ?? this.isSkiIn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isPool': isPool,
      'isPiano': isPiano,
      'isHotTub': isHotTub,
      'isPatio': isPatio,
      'isBBQGrill': isBBQGrill,
      'outdoorDiningArea': outdoorDiningArea,
      'isBeach': isBeach,
      'isExerciseEquipment': isExerciseEquipment,
      'isFirePit': isFirePit,
      'isInDoorFirePlace': isInDoorFirePlace,
      'isLakeAccess': isLakeAccess,
      'isOutdoorShower': isOutdoorShower,
      'isOutdoordiningArea': isOutdoordiningArea,
      'isPoolTable': isPoolTable,
      'isSkiIn': isSkiIn,
    };
  }

  factory StandoutAmenitieModel.fromMap(Map<String, dynamic> map) {
    return StandoutAmenitieModel(
      isPool: (map["isPool"] ?? false) as bool,
      isPiano: (map["isPiano"] ?? false) as bool,
      isHotTub: (map["isHotTub"] ?? false) as bool,
      isPatio: (map["isPatio"] ?? false) as bool,
      isBBQGrill: (map["isBBQGrill"] ?? false) as bool,
      outdoorDiningArea: (map["outdoorDiningArea"] ?? false) as bool,
      isBeach: (map["isBeach"] ?? false) as bool,
      isExerciseEquipment: (map["isExerciseEquipment"] ?? false) as bool,
      isFirePit: (map["isFirePit"] ?? false) as bool,
      isInDoorFirePlace: (map["isInDoorFirePlace"] ?? false) as bool,
      isLakeAccess: (map["isLakeAccess"] ?? false) as bool,
      isOutdoorShower: (map["isOutdoorShower"] ?? false) as bool,
      isOutdoordiningArea: (map["isOutdoordiningArea"] ?? false) as bool,
      isPoolTable: (map["isPoolTable"] ?? false) as bool,
      isSkiIn: (map["isSkiIn"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StandoutAmenitieModel.fromJson(String source) =>
      StandoutAmenitieModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StandoutAmenitieModel(isPool: $isPool, isPiano: $isPiano, isHotTub: $isHotTub, isPatio: $isPatio, isBBQGrill: $isBBQGrill, outdoorDiningArea: $outdoorDiningArea, isBeach: $isBeach, isExerciseEquipment: $isExerciseEquipment, isFirePit: $isFirePit, isInDoorFirePlace: $isInDoorFirePlace, isLakeAccess: $isLakeAccess, isOutdoorShower: $isOutdoorShower, isOutdoordiningArea: $isOutdoordiningArea, isPoolTable: $isPoolTable, isSkiIn: $isSkiIn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StandoutAmenitieModel &&
        other.isPool == isPool &&
        other.isPiano == isPiano &&
        other.isHotTub == isHotTub &&
        other.isPatio == isPatio &&
        other.isBBQGrill == isBBQGrill &&
        other.outdoorDiningArea == outdoorDiningArea &&
        other.isBeach == isBeach &&
        other.isExerciseEquipment == isExerciseEquipment &&
        other.isFirePit == isFirePit &&
        other.isInDoorFirePlace == isInDoorFirePlace &&
        other.isLakeAccess == isLakeAccess &&
        other.isOutdoorShower == isOutdoorShower &&
        other.isOutdoordiningArea == isOutdoordiningArea &&
        other.isPoolTable == isPoolTable &&
        other.isSkiIn == isSkiIn;
  }

  @override
  int get hashCode {
    return isPool.hashCode ^
        isPiano.hashCode ^
        isHotTub.hashCode ^
        isPatio.hashCode ^
        isBBQGrill.hashCode ^
        outdoorDiningArea.hashCode ^
        isBeach.hashCode ^
        isExerciseEquipment.hashCode ^
        isFirePit.hashCode ^
        isInDoorFirePlace.hashCode ^
        isLakeAccess.hashCode ^
        isOutdoorShower.hashCode ^
        isOutdoordiningArea.hashCode ^
        isPoolTable.hashCode ^
        isSkiIn.hashCode;
  }
}
