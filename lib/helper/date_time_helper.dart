import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  Future<String> openDatePicker(BuildContext context, {initialDate}) async {
    DateTime? dateTime = await (showDatePicker(
      context: context,
      initialDate: initialDate == null
          ? DateTime.now()
          : DateFormat("dd/MM/yyyy").parse(initialDate),
      firstDate: DateTime.now().subtract(
        const Duration(days: 36500),
      ),
      lastDate: DateTime.now(),
    ));
    return '${dateTime?.day}/${dateTime?.month}/${dateTime?.year}';
  }
}
