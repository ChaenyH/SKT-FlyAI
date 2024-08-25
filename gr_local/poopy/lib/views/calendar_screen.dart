import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/calendar_widget.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool needChat = true; // 조건에 따라 true/false 설정

    return Scaffold(
      appBar: AppBar(
        title: Text('CalendarScreen'),
      ),
      body: Column(
        children: [
          CalendarWidget( // 나중에 구현할 위젯
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
