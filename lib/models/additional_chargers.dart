import 'dart:convert';

class AdditionalCharges {
  double? cleaningFee;
  double? petFee;
  double? extraGuestFee;
  AdditionalCharges({
    this.cleaningFee,
    this.petFee,
    this.extraGuestFee,
  });

  AdditionalCharges copyWith({
    double? cleaningFee,
    double? petFee,
    double? extraGuestFee,
  }) {
    return AdditionalCharges(
      cleaningFee: cleaningFee ?? this.cleaningFee,
      petFee: petFee ?? this.petFee,
      extraGuestFee: extraGuestFee ?? this.extraGuestFee,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (cleaningFee != null) {
      result.addAll({'cleaningFee': cleaningFee});
    }
    if (petFee != null) {
      result.addAll({'petFee': petFee});
    }
    if (extraGuestFee != null) {
      result.addAll({'extraGuestFee': extraGuestFee});
    }

    return result;
  }

  factory AdditionalCharges.fromMap(Map<String, dynamic> map) {
    return AdditionalCharges(
      cleaningFee: map['cleaningFee']?.toDouble(),
      petFee: map['petFee']?.toDouble(),
      extraGuestFee: map['extraGuestFee']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalCharges.fromJson(String source) =>
      AdditionalCharges.fromMap(json.decode(source));

  @override
  String toString() =>
      'AdditionalCharges(cleaningFee: $cleaningFee, petFee: $petFee, extraGuestFee: $extraGuestFee)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdditionalCharges &&
        other.cleaningFee == cleaningFee &&
        other.petFee == petFee &&
        other.extraGuestFee == extraGuestFee;
  }

  @override
  int get hashCode =>
      cleaningFee.hashCode ^ petFee.hashCode ^ extraGuestFee.hashCode;
}
