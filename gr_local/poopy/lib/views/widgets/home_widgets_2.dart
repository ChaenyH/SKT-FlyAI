import 'package:flutter/material.dart';

class BadgesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      padding: EdgeInsets.all(contextWidth * 0.5),
      width: double.infinity,
      height: contextHeight * 1.5,
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Badges',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: contextHeight * 0.1),
          // 배지 항목 예시
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 10),
              Text('Achievement 1'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 10),
              Text('Achievement 2'),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatLogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      padding: EdgeInsets.all(contextWidth * 0.5),
      width: double.infinity,
      height: contextHeight * 1,
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat, color: Colors.white,),
            SizedBox(width: contextWidth * 0.3,),
            Text(
              '챗 로그 보러 가기',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniGalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      padding: EdgeInsets.all(contextWidth * 0.5),
      width: double.infinity,
      height: contextHeight * 1.5,
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mini Gallery',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // 갤러리 항목 예시
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Image.asset('assets/images/dog1.png', width: 50, height: 50),
          //     Image.asset('assets/images/dog2.png', width: 50, height: 50),
          //     Image.asset('assets/images/dog3.png', width: 50, height: 50),
          //   ],
          // ),
        ],
      ),
    );
  }
}
