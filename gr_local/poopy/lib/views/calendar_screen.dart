import 'package:flutter/material.dart';
import 'package:poopy/views/rive_background.dart';
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
    _events = _fetchEventsForDate(_selectedDate);
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
      _events = _fetchEventsForDate(date);
    });
  }

  List<Map<String, dynamic>> _fetchEventsForDate(DateTime date) {
    List<Map<String, dynamic>> events = [
      {
        "title": "건강한 똥!",
        "bristol": 4,
        "colorName": "Brown",
        "blood": "X",
        "color": Color(0xFFB3F2BB).withOpacity(0.8),
        "icon": Icons.thumb_up,
      },
      {
        "title": "주의가 필요해요",
        "bristol": 2,
        "colorName": "Green",
        "blood": "X",
        "color": Color(0xFFFFEC9A).withOpacity(0.8),
        "icon": Icons.warning,
      },
      {
        "title": "빠른 시일 내에 병원에 방문",
        "bristol": 7,
        "colorName": "Black",
        "blood": "O",
        "color": Color(0xFFFFC9C9).withOpacity(0.8),
        "icon": Icons.local_hospital,
      },
    ];

    return events;
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Stack(
        children: [
          const StalledBackground2(), // RiveBackground 추가
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 뒤로가기 버튼
              Padding(
                padding: EdgeInsets.only(
                  top: contextHeight * 0.4,
                  bottom: contextHeight * 0.1,
                  left: contextWidth * 0.2
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              CustomCalendarWidget(
                onDateChanged: _onDateChanged,
                imagesList: generateDummyImagesList(),
              ),
            ],
          ),
          DraggableDateInfoPanel(
            selectedDate: _selectedDate,
            events: _events,
          ),
        ],
      ),
      floatingActionButton: GlobalExpandableFab(),
    );
  }
}
