import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../controllers/navigation_controller.dart';

class BadgesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.all(contextWidth * 0.5),
          width: double.infinity,
          height: contextHeight * 1.8,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Badges',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: contextHeight * 0.2),
              // 배지 항목 예시
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: contextWidth * 0.4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: contextHeight * 0.6,
                      child: Image.asset(
                        'assets/images/badge1.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: contextHeight * 0.6,
                      child: Image.asset(
                        'assets/images/badge2.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: contextHeight * 0.6,
                      child: Image.asset(
                        'assets/images/badge3.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: contextHeight * 0.6,
                      child: Image.asset(
                        'assets/images/badge4.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ChatLogWidget extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return GestureDetector(
      onTap: () {
        _navController.navigateToChatlog(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: EdgeInsets.all(contextWidth * 0.5),
            width: double.infinity,
            height: contextHeight * 1,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat, color: Colors.white),
                  SizedBox(width: contextWidth * 0.3),
                  Text(
                    '챗 로그 보러 가기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class MiniGalleryWidget extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/dog1.jpg',
    'assets/images/dog2.jpg',
    'assets/images/dog3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: double.infinity,
          height: contextHeight * 1.5,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: contextWidth * 0.05,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: PageView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}