import 'package:flutter/material.dart';
import '../../controllers/navigation_controller.dart';

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
                '오뎅이의 8월 25일 최근 건강 확인',
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
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0), // 패딩 추가
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 가로 방향 가운데 정렬
            children: [
              Icon(icon, size: 24.0), // 아이콘 크기
              SizedBox(width: 8.0), // 아이콘과 텍스트 사이의 간격
              Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
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