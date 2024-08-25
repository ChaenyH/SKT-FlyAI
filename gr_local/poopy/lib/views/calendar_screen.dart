import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/calendar_widget.dart';
import 'package:poopy/views/widgets/draggable_date_info_panel.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  List<String> _events = [];

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
      _events = _fetchEventsForDate(date);
    });
  }

  List<String> _fetchEventsForDate(DateTime date) {
    // 이곳에 특정 날짜의 이벤트 로직을 추가합니다
    return [
      'Meeting with John',
      'Doctor Appointment',
      'Lunch with Sarah',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalendarScreen'),
      ),
        body: Stack(
          children: [
            Column(
              children: [
                CalendarWidget(
                  onDateChanged: _onDateChanged,
                ),
                // 여기에 선택된 날짜의 간단한 정보 등을 표시할 수 있음
              ],
            ),
            DraggableDateInfoPanel(
              selectedDate: _selectedDate,
              events: _events,
            ),
          ],
        ),
      floatingActionButton: GlobalExpandableFab()
    );
  }
}
