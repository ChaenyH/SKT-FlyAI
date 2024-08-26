import 'package:flutter/material.dart';
import '../controllers/navigation_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(contextWidth * 0.5),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: contextHeight * 1.3),
            // 로고 이미지 추가
            Container(
              width: double.infinity,
              height: contextHeight * 3.8,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.8),
                  width: contextWidth * 0.1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/poopy_logo.png',
                    width: contextWidth * 6,
                  ),
                  SizedBox(height: contextHeight * 0.5),
                  // "Hello! We are Poopy!" 텍스트
                  Text(
                    "Hello!\nWe are Poopy!",
                    style: TextStyle(
                      fontSize: contextWidth * 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: contextHeight * 1.5),
            // "시작하기" 버튼
            ElevatedButton(
              onPressed: () {
                // 시작하기 버튼 클릭 시 로그인 화면으로 이동
                _navController.navigateToLogin(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: contextWidth * 0.5,
                  right: contextWidth * 0.8,
                  top: contextHeight * 0.2,
                  bottom: contextHeight * 0.2,
                ),
                backgroundColor: Colors.white.withOpacity(0.9),
                textStyle: TextStyle(fontSize: 20),
                side: BorderSide(
                  color: Colors.white,
                  width: contextWidth * 0.1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: contextWidth * 0.3,),
                  Text(
                    'Let\'s Start!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: contextHeight * 1),
            // 하단 크레딧 텍스트
            Text(
              'SK Telecom FLY AI Challengers\n© 2024 Team Golden Retriever. All rights reserved',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF9B7BC1),  // 배경 색상
    );
  }
}
