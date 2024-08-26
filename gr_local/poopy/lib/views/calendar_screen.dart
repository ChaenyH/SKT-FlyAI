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
  List<Map<String, dynamic>> _events = [];

  @override
  void initState() {
    super.initState();
    // 초기화 시 현재 날짜에 대한 이벤트를 가져옵니다.
    _events = _fetchEventsForDate(_selectedDate);
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
      _events = _fetchEventsForDate(date);
    });
  }

  List<Map<String, dynamic>> _fetchEventsForDate(DateTime date) {
    // 여기서는 날짜를 바탕으로 임의의 데이터를 생성하는 예시입니다.
    // 실제 구현에서는 서버나 로컬 데이터베이스에서 데이터를 가져오는 로직이 필요할 수 있습니다.
    List<Map<String, dynamic>> events = [
      {
        "title": "건강한 똥!",
        "bristol": 4,
        "colorName": "Brown",
        "blood": "X",
        "color": Color(0xFFB3F2BB), // 초록색
        "icon": Icons.thumb_up, // 엄지손가락 아이콘
      },
      {
        "title": "주의가 필요해요",
        "bristol": 2,
        "colorName": "Green",
        "blood": "X",
        "color": Color(0xFFFFEC9A), // 노란색
        "icon": Icons.warning, // 경고 아이콘
      },
      {
        "title": "빠른 시일 내에 병원에 방문",
        "bristol": 7,
        "colorName": "Black",
        "blood": "O",
        "color": Color(0xFFFFC9C9), // 빨간색
        "icon": Icons.local_hospital, // 병원 아이콘
      },
    ];

    // 실제 이벤트가 날짜에 따라 달라지도록 로직을 추가할 수 있음
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('CalendarScreen'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              CustomCalendarWidget(
                onDateChanged: _onDateChanged,
                imagesList: generateDummyImagesList(), // 임의 더미 데이터 사용
              ),
              // 여기에 선택된 날짜의 간단한 정보 등을 표시할 수 있음
            ],
          ),
          DraggableDateInfoPanel(
            selectedDate: _selectedDate,
            events: _events, // _events는 초기화 시 설정된 현재 날짜의 이벤트를 포함합니다.
          ),
        ],
      ),
      floatingActionButton: GlobalExpandableFab(),
    );
  }
}
