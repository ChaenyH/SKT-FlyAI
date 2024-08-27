import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:poopy/views/rive_background.dart';
import '../controllers/navigation_controller.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Stack(
        children: [
          RiveBackground(blurSigmaX: 20, blurSigmaY: 15), // RiveBackground 추가
          Center(
            child: Container(
              padding: EdgeInsets.all(contextWidth * 0.5),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: contextHeight * 1.3),
                  // 글라스모피즘 스타일의 로고 컨테이너
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: contextHeight * 3.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: contextWidth * 0.05,
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
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: contextHeight * 1.5),
                  // 글라스모피즘 스타일의 "시작하기" 버튼
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showCustomLoginDialog(context);  // 로그인 다이얼로그 호출
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
                            color: Colors.white.withOpacity(1),
                            width: contextWidth * 0.05,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            SizedBox(width: contextWidth * 0.3),
                            Text(
                              'Let\'s Start!',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
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
          ),
        ],
      ),
    );
  }
}
