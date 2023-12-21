import 'dart:convert';

class Animities {
  bool isWifi = true;
  bool isTv = false;
  bool isKitchen = false;
  bool isWasher = false;
  bool isFreeParking = false;
  bool isPaidParking = false;
  bool isAirConditioning = false;
  bool isDedicatedWorkspace = false;
  Animities({
    this.isWifi = false,
    this.isTv = false,
    this.isKitchen = false,
    this.isWasher = false,
    this.isFreeParking = false,
    this.isPaidParking = false,
    this.isAirConditioning = false,
    this.isDedicatedWorkspace = false,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isWifi': isWifi});
    result.addAll({'isTv': isTv});
    result.addAll({'isKitchen': isKitchen});
    result.addAll({'isWasher': isWasher});
    result.addAll({'isFreeParking': isFreeParking});
    result.addAll({'isPaidParking': isPaidParking});
    result.addAll({'isAirConditioning': isAirConditioning});
    result.addAll({'isDedicatedWorkspace': isDedicatedWorkspace});

    return result;
  }

  factory Animities.fromMap(Map<String, dynamic> map) {
    return Animities(
      isWifi: map['isWifi'] ?? false,
      isTv: map['isTv'] ?? false,
      isKitchen: map['isKitchen'] ?? false,
      isWasher: map['isWasher'] ?? false,
      isFreeParking: map['isFreeParking'] ?? false,
      isPaidParking: map['isPaidParking'] ?? false,
      isAirConditioning: map['isAirConditioning'] ?? false,
      isDedicatedWorkspace: map['isDedicatedWorkspace'] ?? false,
    );
  }

  Animities copyWith({
    bool? isWifi,
    bool? isTv,
    bool? isKitchen,
    bool? isWasher,
    bool? isFreeParking,
    bool? isPaidParking,
    bool? isAirConditioning,
    bool? isDedicatedWorkspace,
  }) {
    return Animities(
      isWifi: isWifi ?? this.isWifi,
      isTv: isTv ?? this.isTv,
      isKitchen: isKitchen ?? this.isKitchen,
      isWasher: isWasher ?? this.isWasher,
      isFreeParking: isFreeParking ?? this.isFreeParking,
      isPaidParking: isPaidParking ?? this.isPaidParking,
      isAirConditioning: isAirConditioning ?? this.isAirConditioning,
      isDedicatedWorkspace: isDedicatedWorkspace ?? this.isDedicatedWorkspace,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animities.fromJson(String source) =>
      Animities.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Animities(isWifi: $isWifi, isTv: $isTv, isKitchen: $isKitchen, isWasher: $isWasher, isFreeParking: $isFreeParking, isPaidParking: $isPaidParking, isAirConditioning: $isAirConditioning, isDedicatedWorkspace: $isDedicatedWorkspace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Animities &&
        other.isWifi == isWifi &&
        other.isTv == isTv &&
        other.isKitchen == isKitchen &&
        other.isWasher == isWasher &&
        other.isFreeParking == isFreeParking &&
        other.isPaidParking == isPaidParking &&
        other.isAirConditioning == isAirConditioning &&
        other.isDedicatedWorkspace == isDedicatedWorkspace;
  }

  @override
  int get hashCode {
    return isWifi.hashCode ^
        isTv.hashCode ^
        isKitchen.hashCode ^
        isWasher.hashCode ^
        isFreeParking.hashCode ^
        isPaidParking.hashCode ^
        isAirConditioning.hashCode ^
        isDedicatedWorkspace.hashCode;
  }
}
