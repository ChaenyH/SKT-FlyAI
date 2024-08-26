import 'package:flutter/material.dart';

class DraggableDateInfoPanel extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> events;

  DraggableDateInfoPanel({
    required this.selectedDate,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.12,
      maxChildSize: 0.98,
      snap: true, // 스냅 설정
      snapSizes: [0.12, 0.5, 0.98], // 스냅될 크기 비율 설정
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: EdgeInsets.only(top: contextHeight * 0.2),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: contextHeight * 0.1,
                    horizontal: contextWidth * 0.2,
                  ),
                  child: SelectedDateInformation(
                    date: selectedDate,
                    events: events,
                  ),
                ),
              ],
            )
          ),
        );
      },
    );
  }
}

class SelectedDateInformation extends StatelessWidget {
  final DateTime date;
  final List<String> events;

  const SelectedDateInformation({
    super.key,
    required this.date,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: contextWidth * 0.5,
            vertical: contextHeight * 0.2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    '${date.day} ${_monthName(date.month)} ${date.year}',
                    style: TextStyle(
                      fontSize: contextWidth * 0.5,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Container(
                height: contextHeight * 7.5, // 높이 조정
                child: events.isNotEmpty
                    ? ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Color(0xFFC9E8FF) // 첫 번째 색상
                            : Color(0xFFFFC9C9), // 두 번째 색상
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Text(events[index]),
                        subtitle: Text('Details about ${events[index]}'),
                      ),
                    );
                  },
                )
                : Center(
                  child: Text(
                    'No events for this day.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}