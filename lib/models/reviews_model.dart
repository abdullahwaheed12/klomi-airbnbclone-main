import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ReviewsModel {
  final String name;
  final DateTime time;
  final String image;
  final String description;
  final String review;
  final double rating;
  final String reviewByUserId;
  final String reviewToUserId;
  final String adId;
  ReviewsModel({
    required this.name,
    required this.time,
    required this.image,
    required this.description,
    required this.review,
    required this.rating,
    required this.reviewByUserId,
    required this.reviewToUserId,
    required this.adId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReviewsModel &&
        other.name == name &&
        other.time == time &&
        other.image == image &&
        other.description == description &&
        other.review == review &&
        other.rating == rating &&
        other.reviewByUserId == reviewByUserId &&
        other.reviewToUserId == reviewToUserId &&
        other.adId == adId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        time.hashCode ^
        image.hashCode ^
        description.hashCode ^
        review.hashCode ^
        rating.hashCode ^
        reviewByUserId.hashCode ^
        reviewToUserId.hashCode ^
        adId.hashCode;
  }

  @override
  String toString() {
    return 'ReviewsModel(name: $name, time: $time, image: $image, description: $description, review: $review, rating: $rating, reviewByUserId: $reviewByUserId, reviewToUserId: $reviewToUserId, adId: $adId)';
  }

  ReviewsModel copyWith({
    String? name,
    DateTime? time,
    String? image,
    String? description,
    String? review,
    double? rating,
    String? reviewByUserId,
    String? reviewToUserId,
    String? adId,
  }) {
    return ReviewsModel(
      name: name ?? this.name,
      time: time ?? this.time,
      image: image ?? this.image,
      description: description ?? this.description,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      reviewByUserId: reviewByUserId ?? this.reviewByUserId,
      reviewToUserId: reviewToUserId ?? this.reviewToUserId,
      adId: adId ?? this.adId,
    );
  }

  factory ReviewsModel.fromMap(Map<String, dynamic> map) {
    return ReviewsModel(
      name: map['name'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      review: map['review'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      reviewByUserId: map['reviewByUserId'] ?? '',
      reviewToUserId: map['reviewToUserId'] ?? '',
      adId: map['adId'] ?? '',
    );
  }

  factory ReviewsModel.fromJson(String source) =>
      ReviewsModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'time': time.millisecondsSinceEpoch});
    result.addAll({'image': image});
    result.addAll({'description': description});
    result.addAll({'review': review});
    result.addAll({'rating': rating});
    result.addAll({'reviewByUserId': reviewByUserId});
    result.addAll({'reviewToUserId': reviewToUserId});
    result.addAll({'adId': adId});

    return result;
  }

  String toJson() => json.encode(toMap());
}
