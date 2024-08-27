import 'package:flutter/material.dart';
import '../../controllers/navigation_controller.dart';
import '../card_news_screen.dart';
import 'dart:ui';

class StatusCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: contextHeight * 3,
            decoration: BoxDecoration(
              color: Color(0xFFCE94D8).withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 4),
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
                    '오뎅이의 8월 25일 최근 건강 확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contextWidth * 0.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: contextHeight * 0.2,
                      horizontal: contextWidth * 0.8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            'assets/images/poop_icon_1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: contextWidth * 0.5,
                                bottom: contextHeight * 0.2
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: contextHeight * 0.1,
                                      horizontal: contextWidth * 0.3
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600.withOpacity(0.8),
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
                                      fontSize: contextWidth * 0.37,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '\n주로 흑갈색을 띠며,\n피가 조금 묻어나왔어요.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: contextWidth * 0.35,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class HomeActionButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  HomeActionButtonWidget({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
            width: 1.5,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(16.0), // 패딩 추가
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로 방향 가운데 정렬
                children: [
                  Icon(
                    icon,
                    size: 24.0,
                    color: Colors.white,), // 아이콘 크기
                  SizedBox(width: 8.0), // 아이콘과 텍스트 사이의 간격
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
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

class HomeCameraButtonWidget extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    return HomeActionButtonWidget(
      title: '사진 촬영하기',
      icon: Icons.camera_alt,
      onTap: () {
        _navController.navigateToCamera(context);
      },
    );
  }
}




class CardNewsWidget extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/cardnews1.jpg',
    'assets/images/cardnews2.jpg',
    'assets/images/cardnews3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: contextHeight * 2.5,  // 이미지 슬라이더의 높이
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: contextWidth * 0.05,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardNewsScreen(index: index),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.fitHeight,  // 이미지를 높이에 맞춰서 조절
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}