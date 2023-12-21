import 'dart:convert';

import '../../../../enums/message_status.dart';

class ChatMessage {
  String sendBy;
  String message;
  int time;
  String type;
  MessageStatus messageStatus;
  ChatMessage({
    required this.messageStatus,
    required this.sendBy,
    required this.message,
    required this.time,
    required this.type,
  });

  ChatMessage copyWith({
    String? sendBy,
    String? message,
    int? time,
    String? type,
    MessageStatus? messageStatus,
  }) {
    return ChatMessage(
      messageStatus: messageStatus ?? this.messageStatus,
      sendBy: sendBy ?? this.sendBy,
      message: message ?? this.message,
      time: time ?? this.time,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'messageStatus': messageStatus.name});

    result.addAll({'sendBy': sendBy});
    result.addAll({'message': message});
    result.addAll({'time': time});
    result.addAll({'type': type});

    return result;
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageStatus: MessageStatus.values.byName(map['messageStatus']),
      sendBy: map['sendBy'] ?? '',
      message: map['message'] ?? '',
      time: map['time']?.toInt() ?? 0,
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(sendBy: $sendBy, message: $message, time: $time, type: $type,messageStatus $messageStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessage &&
        other.messageStatus.name == messageStatus.name &&
        other.sendBy == sendBy &&
        other.message == message &&
        other.time == time &&
        other.type == type;
  }

  @override
  int get hashCode {
    return sendBy.hashCode ^
        message.hashCode ^
        time.hashCode ^
        type.hashCode ^
        messageStatus.name.hashCode;
  }
}
