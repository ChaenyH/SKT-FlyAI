import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/calendar_widget.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalendarScreen'),
      ),
      body: Column(
        children: [
          CalendarWidget(
            onDateChanged: (date) {
              // 날짜 변경 처리
            },
          ),
          Expanded(
            child: Center(
              child: Text('Selected Date\'s Information'),
            ),
          ),
        ],
      ),
      floatingActionButton: GlobalExpandableFab()
    );
  }
}
