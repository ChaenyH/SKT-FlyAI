import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final Function(DateTime) onDateChanged;

  CalendarWidget({required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        onDateChanged: onDateChanged,
      ),
    );
  }
}
