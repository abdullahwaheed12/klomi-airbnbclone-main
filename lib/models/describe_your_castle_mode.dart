// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DescripYourCastleModel {
  bool isRare = false;
  bool isRustic = false;
  bool isInNature = false;
  bool isMemorable = false;
  bool isRomantic = false;
  bool isHistoric = false;
  DescripYourCastleModel({
    this.isRare = false,
    this.isRustic = false,
    this.isInNature = false,
    this.isMemorable = false,
    this.isRomantic = false,
    this.isHistoric = false,
  });

  DescripYourCastleModel copyWith({
    bool? isRare,
    bool? isRustic,
    bool? isInNature,
    bool? isMemorable,
    bool? isRomantic,
    bool? isHistoric,
  }) {
    return DescripYourCastleModel(
      isRare: isRare ?? this.isRare,
      isRustic: isRustic ?? this.isRustic,
      isInNature: isInNature ?? this.isInNature,
      isMemorable: isMemorable ?? this.isMemorable,
      isRomantic: isRomantic ?? this.isRomantic,
      isHistoric: isHistoric ?? this.isHistoric,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isRare': isRare,
      'isRustic': isRustic,
      'isInNature': isInNature,
      'isMemorable': isMemorable,
      'isRomantic': isRomantic,
      'isHistoric': isHistoric,
    };
  }

  factory DescripYourCastleModel.fromMap(Map<String, dynamic> map) {
    return DescripYourCastleModel(
      isRare: (map["isRare"] ?? false) as bool,
      isRustic: (map["isRustic"] ?? false) as bool,
      isInNature: (map["isInNature"] ?? false) as bool,
      isMemorable: (map["isMemorable"] ?? false) as bool,
      isRomantic: (map["isRomantic"] ?? false) as bool,
      isHistoric: (map["isHistoric"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DescripYourCastleModel.fromJson(String source) =>
      DescripYourCastleModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DescripYourCastleModel(isRare: $isRare, isRustic: $isRustic, isInNature: $isInNature, isMemorable: $isMemorable, isRomantic: $isRomantic, isHistoric: $isHistoric)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DescripYourCastleModel &&
        other.isRare == isRare &&
        other.isRustic == isRustic &&
        other.isInNature == isInNature &&
        other.isMemorable == isMemorable &&
        other.isRomantic == isRomantic &&
        other.isHistoric == isHistoric;
  }

  @override
  int get hashCode {
    return isRare.hashCode ^
        isRustic.hashCode ^
        isInNature.hashCode ^
        isMemorable.hashCode ^
        isRomantic.hashCode ^
        isHistoric.hashCode;
  }
}
