// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

class Offers {
  final String name;
  final IconData image;

  Offers({
    required this.name,
    required this.image,
  });

  factory Offers.fromMap(Map<String, dynamic> json) => Offers(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image.codePoint,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Offers && other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;

  @override
  String toString() => 'Offers(name: $name, image: $image)';

  Offers copyWith({
    String? name,
    IconData? image,
  }) {
    return Offers(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
