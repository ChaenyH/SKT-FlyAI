import 'package:flutter/material.dart';

import '../../controllers/navigation_controller.dart';

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
