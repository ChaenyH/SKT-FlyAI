import 'package:flutter/material.dart';

class CardNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: contextHeight * 0.1,
            horizontal: contextWidth * 0.3,
          ),
          alignment: Alignment.bottomLeft,
          child: Text(
            "오뎅이 견주님을 위한 오늘의 정보",
            style: TextStyle(
              fontSize: contextWidth * 0.4,
            ),
          ),
        ),
        Card(
          child: Container(
            height: contextHeight * 2.5,
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text('Card News'),
              onTap: () {
                Navigator.pushNamed(context, '/cardnews');
              },
            ),
          )
        ),
      ],
    );
  }
}