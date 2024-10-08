import 'dart:ui';
import 'package:flutter/material.dart';



class DraggableDateInfoPanel extends StatelessWidget {
  final DateTime selectedDate;
  final List<Map<String, dynamic>> events;

  DraggableDateInfoPanel({
    required this.selectedDate,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.12,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: [0.12, 0.4, 0.9],
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: 1.5,
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,

                child: Column(
                  children: [

                    Center(
                      child: Container(
                        width: contextWidth * 1.5,
                        height: 5,
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: contextHeight * 0.1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1.5,
                          ),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



class SelectedDateInformation extends StatelessWidget {
  final DateTime date;
  final List<Map<String, dynamic>> events;

  const SelectedDateInformation({
    super.key,
    required this.date,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        // 오늘의 날짜 표시
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1,),
            child: Text(
              '${date.day} ${_monthName(date.month)} ${date.year}',
              style: TextStyle(
                fontSize: contextWidth * 0.5,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.15), // Subtle shadow for glassmorphism
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          alignment: Alignment.topCenter,
          height: contextHeight * 9,

          child: events.isNotEmpty
          ? ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {

              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: contextHeight * 0.1,
                  horizontal: contextWidth * 0.3,
                ),
                padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                decoration: BoxDecoration(
                  color: events[index]['color'],
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.5,
                  ),
                ),

                child: ListTile(

                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.3),
                    child: Icon(
                      events[index]['icon'],
                      color: Colors.black,
                      size: contextWidth * 0.8,
                    ),
                  ),

                  title: Text(
                    events[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  subtitle: Text(
                    'Bristol: lv. ${events[index]['bristol']}\nColor: ${events[index]['colorName']},  Blood: ${events[index]['blood']}',
                    style: TextStyle(color: Colors.black),
                  ),

                ),

              );
            },
          )

          : Center(
            child: Text(
              '기록이 없습니다.',
              style: TextStyle(color: Colors.black),
            ),
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
