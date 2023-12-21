import 'dart:convert';

class SenicView {
  bool isBayView;
  bool isCanalView;
  bool isCitySkyLineView;
  bool isCoutyarView;
  bool isDesertView;
  bool isGardenVeiw;
  bool isGolfView;
  bool isHarborView;
  bool isLakeView;
  bool isMarinaView;
  bool isMountainView;
  bool isOceanView;
  bool isParkView;
  bool isPoolView;
  bool isResortView;
  bool isSeaViewl;
  bool isValleyView;
  bool isVineyarView;
  SenicView({
    this.isBayView = false,
    this.isCanalView = false,
    this.isCitySkyLineView = false,
    this.isCoutyarView = false,
    this.isDesertView = false,
    this.isGardenVeiw = false,
    this.isGolfView = false,
    this.isHarborView = false,
    this.isLakeView = false,
    this.isMarinaView = false,
    this.isMountainView = false,
    this.isOceanView = false,
    this.isParkView = false,
    this.isPoolView = false,
    this.isResortView = false,
    this.isSeaViewl = false,
    this.isValleyView = false,
    this.isVineyarView = false,
  });

  SenicView copyWith({
    bool? isBayView,
    bool? isCanalView,
    bool? isCitySkyLineView,
    bool? isCoutyarView,
    bool? isDesertView,
    bool? isGardenVeiw,
    bool? isGolfView,
    bool? isHarborView,
    bool? isLakeView,
    bool? isMarinaView,
    bool? isMountainView,
    bool? isOceanView,
    bool? isParkView,
    bool? isPoolView,
    bool? isResortView,
    bool? isSeaViewl,
    bool? isValleyView,
    bool? isVineyarView,
  }) {
    return SenicView(
      isBayView: isBayView ?? this.isBayView,
      isCanalView: isCanalView ?? this.isCanalView,
      isCitySkyLineView: isCitySkyLineView ?? this.isCitySkyLineView,
      isCoutyarView: isCoutyarView ?? this.isCoutyarView,
      isDesertView: isDesertView ?? this.isDesertView,
      isGardenVeiw: isGardenVeiw ?? this.isGardenVeiw,
      isGolfView: isGolfView ?? this.isGolfView,
      isHarborView: isHarborView ?? this.isHarborView,
      isLakeView: isLakeView ?? this.isLakeView,
      isMarinaView: isMarinaView ?? this.isMarinaView,
      isMountainView: isMountainView ?? this.isMountainView,
      isOceanView: isOceanView ?? this.isOceanView,
      isParkView: isParkView ?? this.isParkView,
      isPoolView: isPoolView ?? this.isPoolView,
      isResortView: isResortView ?? this.isResortView,
      isSeaViewl: isSeaViewl ?? this.isSeaViewl,
      isValleyView: isValleyView ?? this.isValleyView,
      isVineyarView: isVineyarView ?? this.isVineyarView,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isBayView': isBayView});
    result.addAll({'isCanalView': isCanalView});
    result.addAll({'isCitySkyLineView': isCitySkyLineView});
    result.addAll({'isCoutyarView': isCoutyarView});
    result.addAll({'isDesertView': isDesertView});
    result.addAll({'isGardenVeiw': isGardenVeiw});
    result.addAll({'isGolfView': isGolfView});
    result.addAll({'isHarborView': isHarborView});
    result.addAll({'isLakeView': isLakeView});
    result.addAll({'isMarinaView': isMarinaView});
    result.addAll({'isMountainView': isMountainView});
    result.addAll({'isOceanView': isOceanView});
    result.addAll({'isParkView': isParkView});
    result.addAll({'isPoolView': isPoolView});
    result.addAll({'isResortView': isResortView});
    result.addAll({'isSeaViewl': isSeaViewl});
    result.addAll({'isValleyView': isValleyView});
    result.addAll({'isVineyarView': isVineyarView});

    return result;
  }

  factory SenicView.fromMap(Map<String, dynamic> map) {
    return SenicView(
      isBayView: map['isBayView'] ?? false,
      isCanalView: map['isCanalView'] ?? false,
      isCitySkyLineView: map['isCitySkyLineView'] ?? false,
      isCoutyarView: map['isCoutyarView'] ?? false,
      isDesertView: map['isDesertView'] ?? false,
      isGardenVeiw: map['isGardenVeiw'] ?? false,
      isGolfView: map['isGolfView'] ?? false,
      isHarborView: map['isHarborView'] ?? false,
      isLakeView: map['isLakeView'] ?? false,
      isMarinaView: map['isMarinaView'] ?? false,
      isMountainView: map['isMountainView'] ?? false,
      isOceanView: map['isOceanView'] ?? false,
      isParkView: map['isParkView'] ?? false,
      isPoolView: map['isPoolView'] ?? false,
      isResortView: map['isResortView'] ?? false,
      isSeaViewl: map['isSeaViewl'] ?? false,
      isValleyView: map['isValleyView'] ?? false,
      isVineyarView: map['isVineyarView'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SenicView.fromJson(String source) =>
      SenicView.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SenicView(isBayView: $isBayView, isCanalView: $isCanalView, isCitySkyLineView: $isCitySkyLineView, isCoutyarView: $isCoutyarView, isDesertView: $isDesertView, isGardenVeiw: $isGardenVeiw, isGolfView: $isGolfView, isHarborView: $isHarborView, isLakeView: $isLakeView, isMarinaView: $isMarinaView, isMountainView: $isMountainView, isOceanView: $isOceanView, isParkView: $isParkView, isPoolView: $isPoolView, isResortView: $isResortView, isSeaViewl: $isSeaViewl, isValleyView: $isValleyView, isVineyarView: $isVineyarView)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SenicView &&
        other.isBayView == isBayView &&
        other.isCanalView == isCanalView &&
        other.isCitySkyLineView == isCitySkyLineView &&
        other.isCoutyarView == isCoutyarView &&
        other.isDesertView == isDesertView &&
        other.isGardenVeiw == isGardenVeiw &&
        other.isGolfView == isGolfView &&
        other.isHarborView == isHarborView &&
        other.isLakeView == isLakeView &&
        other.isMarinaView == isMarinaView &&
        other.isMountainView == isMountainView &&
        other.isOceanView == isOceanView &&
        other.isParkView == isParkView &&
        other.isPoolView == isPoolView &&
        other.isResortView == isResortView &&
        other.isSeaViewl == isSeaViewl &&
        other.isValleyView == isValleyView &&
        other.isVineyarView == isVineyarView;
  }

  @override
  int get hashCode {
    return isBayView.hashCode ^
        isCanalView.hashCode ^
        isCitySkyLineView.hashCode ^
        isCoutyarView.hashCode ^
        isDesertView.hashCode ^
        isGardenVeiw.hashCode ^
        isGolfView.hashCode ^
        isHarborView.hashCode ^
        isLakeView.hashCode ^
        isMarinaView.hashCode ^
        isMountainView.hashCode ^
        isOceanView.hashCode ^
        isParkView.hashCode ^
        isPoolView.hashCode ^
        isResortView.hashCode ^
        isSeaViewl.hashCode ^
        isValleyView.hashCode ^
        isVineyarView.hashCode;
  }
}
