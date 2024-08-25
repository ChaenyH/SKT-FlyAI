import 'package:flutter/material.dart';

class StatusCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Center(
      child: Container(
        // width: contextWidth * 9,
        height: contextHeight * 3,
        // padding: EdgeInsets.all(16.0), // 부모 컨테이너의 패딩
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade200, // 배경색
          borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // 그림자 색
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4), // 그림자 위치
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: contextHeight * 0.15,
                  horizontal: contextWidth * 0.6,
              ),
              child: Text(
                '오뎅이의 8월 23일 최근 건강 확인',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity, // 연보라색 컨테이너의 너비를 부모에 맞춤
                padding: EdgeInsets.symmetric(
                  vertical: contextHeight * 0.2,
                  horizontal: contextWidth * 0.8,
                ), // 내부 패딩
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/images/poop_icon_1.png', // 아이콘 이미지 경로 설정
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: contextHeight * 0.1,
                                horizontal: contextWidth * 0.3
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              '주의',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: contextHeight * 0.15),
                          Text(
                            '매우 딱딱하고 건조한 변',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '\n주로 흑갈색을 띠며,\n피가 조금 묻어나왔어요.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
