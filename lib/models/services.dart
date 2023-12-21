// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

class Services {
  final String title;
  final IconData image;
  final String description;

  Services({
    required this.title,
    required this.image,
    required this.description,
  });

  factory Services.fromMap(Map<String, dynamic> json) => Services(
        title: json["tilte"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image.codePoint,
      'description': description,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Services &&
        other.title == title &&
        other.image == image &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'Services(title: $title, image: $image, description: $description)';

  Services copyWith({
    String? title,
    IconData? image,
    String? description,
  }) {
    return Services(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}
