import 'dart:convert';

class WifiModel {
  String name;
  String password;
  WifiModel({
    required this.name,
    required this.password,
  });

  WifiModel copyWith({
    String? name,
    String? password,
  }) {
    return WifiModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'password': password});

    return result;
  }

  factory WifiModel.fromMap(Map<String, dynamic> map) {
    return WifiModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WifiModel.fromJson(String source) =>
      WifiModel.fromMap(json.decode(source));

  @override
  String toString() => 'WifiModel(name: $name, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WifiModel &&
        other.name == name &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
