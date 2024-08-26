import 'package:flutter/material.dart';

class CustomCalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final List<ImagesData> imagesList;

  CustomCalendarWidget({
    required this.onDateChanged,
    required this.imagesList,
  });

  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  void _onLeftArrowTap() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
    });
  }

  void _onRightArrowTap() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    widget.onDateChanged(date);
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
      padding: EdgeInsets.symmetric(
        horizontal: contextWidth * 0.3,
        vertical: contextHeight * 0.1,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFCE94D8).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.8),
          width: contextWidth * 0.1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: contextHeight * 0.05),
          CalendarHeader(
            focusedDate: _focusedDate,
            onLeftArrowTap: _onLeftArrowTap,
            onRightArrowTap: _onRightArrowTap,
          ),
          DayLabels(), // 요일 라벨 추가
          SizedBox(height: contextHeight * 0.2),
          Container(
            height: contextHeight * 3.6, // 고정된 높이 설정
            child: CalendarGrid(
              focusedDate: _focusedDate,
              selectedDate: _selectedDate,
              onDateSelected: _onDateSelected,
              imagesList: widget.imagesList,
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDate;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    required this.focusedDate,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Padding(
      padding: EdgeInsets.only(bottom: contextHeight * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: contextHeight * 0.2,
              color: Colors.white,
            ),
            onPressed: onLeftArrowTap,
          ),
          Text(
            '${focusedDate.year}년 ${focusedDate.month.toString().padLeft(2, '0')}월',
            style: TextStyle(
              fontSize: contextHeight * 0.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: contextHeight * 0.2,
              color: Colors.white,
            ),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}

class DayLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dayLabels.map((label) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: contextWidth * 0.3,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CalendarGrid extends StatelessWidget {
  final DateTime focusedDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final List<ImagesData> imagesList;

  const CalendarGrid({
    required this.focusedDate,
    required this.selectedDate,
    required this.onDateSelected,
    required this.imagesList,
  });

  List<DateTime> _generateDaysForGrid() {
    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final int leadingEmptyDays = (firstDayOfMonth.weekday - 1) % 7;
    final startDate = firstDayOfMonth.subtract(Duration(days: leadingEmptyDays));

    return List.generate(42, (index) => startDate.add(Duration(days: index)));
  }

  Widget _buildDayCell(BuildContext context, DateTime date) {
    final bool isInMonth = date.month == focusedDate.month;
    final bool isSelected = _isSelectedDate(date);
    final bool isToday = _isToday(date);

    if (!isInMonth) {
      return const SizedBox.shrink();
    }

    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double fontSize = MediaQuery.of(context).size.width * 0.04;

    return GestureDetector(
      onTap: () => onDateSelected(date),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.orange : Colors.transparent,
        ),
        child: Stack(
          children: [
            Align(
              alignment: FractionalOffset.topLeft,
              child: Container(
                padding: EdgeInsets.all(contextWidth * 0.12),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (_hasMatchingImage(date))
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  child: Image.asset(
                    'assets/images/poop_icon_0.png',
                    width: contextWidth * 1,
                    color: _getIconColor(date),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool _isSelectedDate(DateTime date) {
    return selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;
  }

  bool _isToday(DateTime date) {
    final today = DateTime.now();
    return today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;
  }

  bool _hasMatchingImage(DateTime date) {
    return imagesList.any(
          (image) => DateTime.parse(image.uploadTime).year == date.year &&
          DateTime.parse(image.uploadTime).month == date.month &&
          DateTime.parse(image.uploadTime).day == date.day,
    );
  }

  Color _getIconColor(DateTime date) {
    final matchingImage = imagesList.firstWhere(
          (image) => DateTime.parse(image.uploadTime).year == date.year &&
          DateTime.parse(image.uploadTime).month == date.month &&
          DateTime.parse(image.uploadTime).day == date.day,
      orElse: () => ImagesData(pooColor: "#FFFFFF", uploadTime: ''),
    );

    return Color(int.parse(matchingImage.pooColor!.substring(1), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateDaysForGrid();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) => _buildDayCell(context, days[index]),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class ImagesData {
  final String? pooColor;
  final String uploadTime;

  ImagesData({this.pooColor, required this.uploadTime});
}

// 테스트용 더미 데이터 생성
List<ImagesData> generateDummyImagesList() {
  return [
    ImagesData(pooColor: "#C15C27", uploadTime: DateTime(2024, 8, 14).toIso8601String()),
    ImagesData(pooColor: "#221E1D", uploadTime: DateTime(2024, 8, 15).toIso8601String()),
    ImagesData(pooColor: "#C15C27", uploadTime: DateTime(2024, 8, 17).toIso8601String()),
    ImagesData(pooColor: "#24682B", uploadTime: DateTime(2024, 8, 19).toIso8601String()),
    ImagesData(pooColor: "#C15C27", uploadTime: DateTime(2024, 8, 20).toIso8601String()),
    ImagesData(pooColor: "#C15C27", uploadTime: DateTime(2024, 8, 21).toIso8601String()),
  ];
}
