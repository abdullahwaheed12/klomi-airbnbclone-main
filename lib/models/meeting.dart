import 'dart:convert';

import 'package:flutter/foundation.dart';

class Meeting {
  String meetingTitle;
  String meetingAgenda;
  DateTime start;
  DateTime end;
  DifferenceRemainingTime? difference;
  String meetingID;
  List<String> users;
  String user1Name;
  String user2Name;

  Meeting({
    required this.meetingTitle,
    required this.meetingAgenda,
    required this.start,
    required this.end,
    required this.difference,
    required this.meetingID,
    required this.users,
    required this.user1Name,
    required this.user2Name,
  });

  Meeting copyWith({
    String? meetingTitle,
    String? meetingAgenda,
    DateTime? start,
    DateTime? end,
    DifferenceRemainingTime? difference,
    String? meetingID,
    List<String>? users,
    String? user1Name,
    String? user2Name,
  }) {
    return Meeting(
      meetingTitle: meetingTitle ?? this.meetingTitle,
      meetingAgenda: meetingAgenda ?? this.meetingAgenda,
      start: start ?? this.start,
      end: end ?? this.end,
      difference: difference ?? this.difference,
      meetingID: meetingID ?? this.meetingID,
      users: users ?? this.users,
      user1Name: user1Name ?? this.user1Name,
      user2Name: user2Name ?? this.user2Name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'meetingTitle': meetingTitle});
    result.addAll({'meetingAgenda': meetingAgenda});
    result.addAll({'start': start.millisecondsSinceEpoch});
    result.addAll({'end': end.millisecondsSinceEpoch});
    if (difference != null) {
      result.addAll({'difference': difference!.toMap()});
    }
    result.addAll({'meetingID': meetingID});
    result.addAll({'users': users});
    result.addAll({'user1Name': user1Name});
    result.addAll({'user2Name': user2Name});

    return result;
  }

  factory Meeting.fromMap(Map<String, dynamic> map) {
    return Meeting(
      meetingTitle: map['meetingTitle'] ?? '',
      meetingAgenda: map['meetingAgenda'] ?? '',
      start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      end: DateTime.fromMillisecondsSinceEpoch(map['end']),
      difference: map['difference'] != null
          ? DifferenceRemainingTime.fromMap(map['difference'])
          : null,
      meetingID: map['meetingID'] ?? '',
      users: List<String>.from(map['users']),
      user1Name: map['user1Name'] ?? '',
      user2Name: map['user2Name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Meeting.fromJson(String source) =>
      Meeting.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meeting(meetingTitle: $meetingTitle, meetingAgenda: $meetingAgenda, start: $start, end: $end, difference: $difference, meetingID: $meetingID, users: $users, user1Name: $user1Name, user2Name: $user2Name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meeting &&
        other.meetingTitle == meetingTitle &&
        other.meetingAgenda == meetingAgenda &&
        other.start == start &&
        other.end == end &&
        other.difference == difference &&
        other.meetingID == meetingID &&
        listEquals(other.users, users) &&
        other.user1Name == user1Name &&
        other.user2Name == user2Name;
  }

  @override
  int get hashCode {
    return meetingTitle.hashCode ^
        meetingAgenda.hashCode ^
        start.hashCode ^
        end.hashCode ^
        difference.hashCode ^
        meetingID.hashCode ^
        users.hashCode ^
        user1Name.hashCode ^
        user2Name.hashCode;
  }
}

class DifferenceRemainingTime {
  num days;
  num hours;
  num minute;
  DifferenceRemainingTime({
    required this.days,
    required this.hours,
    required this.minute,
  });

  DifferenceRemainingTime copyWith({
    num? days,
    num? hours,
    num? minute,
  }) {
    return DifferenceRemainingTime(
      days: days ?? this.days,
      hours: hours ?? this.hours,
      minute: minute ?? this.minute,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'days': days});
    result.addAll({'hours': hours});
    result.addAll({'minute': minute});

    return result;
  }

  factory DifferenceRemainingTime.fromMap(Map<String, dynamic> map) {
    return DifferenceRemainingTime(
      days: map['days'] ?? 0,
      hours: map['hours'] ?? 0,
      minute: map['minute'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DifferenceRemainingTime.fromJson(String source) =>
      DifferenceRemainingTime.fromMap(json.decode(source));

  @override
  String toString() =>
      'DifferenceRemainingTime(days: $days, hours: $hours, minute: $minute)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DifferenceRemainingTime &&
        other.days == days &&
        other.hours == hours &&
        other.minute == minute;
  }

  @override
  int get hashCode => days.hashCode ^ hours.hashCode ^ minute.hashCode;
}
