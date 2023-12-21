import 'dart:convert';

class HostSettings {
  bool isInstantBook;
  bool shouldIdentityVerification;
  bool shouldGoodTrackRecord;
  String preBookMessage;
  HostSettings({
    this.isInstantBook = false,
    this.shouldIdentityVerification = false,
    this.shouldGoodTrackRecord = false,
    this.preBookMessage = '',
  });

  HostSettings copyWith({
    bool? isInstantBook,
    bool? shouldIdentityVerification,
    bool? shouldGoodTrackRecord,
    String? preBookMessage,
  }) {
    return HostSettings(
      isInstantBook: isInstantBook ?? this.isInstantBook,
      shouldIdentityVerification:
          shouldIdentityVerification ?? this.shouldIdentityVerification,
      shouldGoodTrackRecord:
          shouldGoodTrackRecord ?? this.shouldGoodTrackRecord,
      preBookMessage: preBookMessage ?? this.preBookMessage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isInstantBook': isInstantBook});
    result.addAll({'shouldIdentityVerification': shouldIdentityVerification});
    result.addAll({'shouldGoodTrackRecord': shouldGoodTrackRecord});
    result.addAll({'preBookMessage': preBookMessage});

    return result;
  }

  factory HostSettings.fromMap(Map<String, dynamic> map) {
    return HostSettings(
      isInstantBook: map['isInstantBook'] ?? false,
      shouldIdentityVerification: map['shouldIdentityVerification'] ?? false,
      shouldGoodTrackRecord: map['shouldGoodTrackRecord'] ?? false,
      preBookMessage: map['preBookMessage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HostSettings.fromJson(String source) =>
      HostSettings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HostSettings(isInstantBook: $isInstantBook, shouldIdentityVerification: $shouldIdentityVerification, shouldGoodTrackRecord: $shouldGoodTrackRecord, preBookMessage: $preBookMessage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HostSettings &&
        other.isInstantBook == isInstantBook &&
        other.shouldIdentityVerification == shouldIdentityVerification &&
        other.shouldGoodTrackRecord == shouldGoodTrackRecord &&
        other.preBookMessage == preBookMessage;
  }

  @override
  int get hashCode {
    return isInstantBook.hashCode ^
        shouldIdentityVerification.hashCode ^
        shouldGoodTrackRecord.hashCode ^
        preBookMessage.hashCode;
  }
}
