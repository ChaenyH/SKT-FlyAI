import 'package:flutter/material.dart';

import '../../controllers/navigation_controller.dart';

class DogProfileWidget extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.8), // 테두리 색상
              width: 2.5, // 테두리 두께
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/dog_profile_1.png'), // 이미지 변경
            radius: 30,
          ),
        ),
        SizedBox(width: contextWidth * 0.4),
        Text(
          '오뎅이',
          style: TextStyle(
            fontSize: contextWidth * 0.5,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.9),
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: contextWidth * 1,
            color: Colors.white.withOpacity(0.9),
          ),
          onPressed: () {
            _showBottomSheet(context);
          },
        ),
      ],
    );
  }

  // 하단 시트를 표시하는 메서드
  void _showBottomSheet(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.close),  // 여기서 trailing을 사용
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // 강아지 추가/변경 UI 또는 다른 콘텐츠 추가
              ListTile(
                leading: Icon(Icons.pets),
                title: Text(
                  '오뎅이',
                  style: TextStyle(
                    fontSize: contextWidth * 0.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // 추가 행동을 정의하세요.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.pets),
                title: Text(
                  '순대',
                  style: TextStyle(
                    fontSize: contextWidth * 0.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // 추가 행동을 정의하세요.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('반려견 추가하기'),
                onTap: () {
                  // 추가 행동을 정의하세요.
                  _navController.navigateToDogSignup(context);
                },
              ),
              SizedBox(height: contextHeight * 0.2,)
            ],
          ),
        );
      },
    );
  }
}

