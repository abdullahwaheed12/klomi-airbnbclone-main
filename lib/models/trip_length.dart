import 'dart:convert';

class TripLengthModel {
  int? minimumStay;
  int? maximuStay;
  bool? manuallyReviewAndApproveReservationRequest;
  bool? doNotAllowReservationRequest;
  TripLengthModel({
    this.minimumStay,
    this.maximuStay,
    this.manuallyReviewAndApproveReservationRequest,
    this.doNotAllowReservationRequest,
  });

  TripLengthModel copyWith({
    int? minimumStay,
    int? maximuStay,
    bool? manuallyReviewAndApproveReservationRequest,
    bool? doNotAllowReservationRequest,
  }) {
    return TripLengthModel(
      minimumStay: minimumStay ?? this.minimumStay,
      maximuStay: maximuStay ?? this.maximuStay,
      manuallyReviewAndApproveReservationRequest:
          manuallyReviewAndApproveReservationRequest ??
              this.manuallyReviewAndApproveReservationRequest,
      doNotAllowReservationRequest:
          doNotAllowReservationRequest ?? this.doNotAllowReservationRequest,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (minimumStay != null) {
      result.addAll({'minimumStay': minimumStay});
    }
    if (maximuStay != null) {
      result.addAll({'maximuStay': maximuStay});
    }
    if (manuallyReviewAndApproveReservationRequest != null) {
      result.addAll({
        'manuallyReviewAndApproveReservationRequest':
            manuallyReviewAndApproveReservationRequest
      });
    }
    if (doNotAllowReservationRequest != null) {
      result.addAll(
          {'doNotAllowReservationRequest': doNotAllowReservationRequest});
    }

    return result;
  }

  factory TripLengthModel.fromMap(Map<String, dynamic> map) {
    return TripLengthModel(
      minimumStay: map['minimumStay']?.toInt(),
      maximuStay: map['maximuStay']?.toInt(),
      manuallyReviewAndApproveReservationRequest:
          map['manuallyReviewAndApproveReservationRequest'],
      doNotAllowReservationRequest: map['doNotAllowReservationRequest'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TripLengthModel.fromJson(String source) =>
      TripLengthModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TripLengthModel(minimumStay: $minimumStay, maximuStay: $maximuStay, manuallyReviewAndApproveReservationRequest: $manuallyReviewAndApproveReservationRequest, doNotAllowReservationRequest: $doNotAllowReservationRequest)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TripLengthModel &&
        other.minimumStay == minimumStay &&
        other.maximuStay == maximuStay &&
        other.manuallyReviewAndApproveReservationRequest ==
            manuallyReviewAndApproveReservationRequest &&
        other.doNotAllowReservationRequest == doNotAllowReservationRequest;
  }

  @override
  int get hashCode {
    return minimumStay.hashCode ^
        maximuStay.hashCode ^
        manuallyReviewAndApproveReservationRequest.hashCode ^
        doNotAllowReservationRequest.hashCode;
  }
}
