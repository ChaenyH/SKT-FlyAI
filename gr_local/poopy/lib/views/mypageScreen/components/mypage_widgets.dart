import 'dart:ui';
import 'package:flutter/material.dart';

// 프로필 섹션 위젯
class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: contextWidth * 0.5,
        vertical: contextHeight * 0.15,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Semi-transparent background
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                AssetImage('assets/images/dog_profile_1.png'), // 강아지 사진 경로
              ),
              SizedBox(width: 16.0),
              Text(
                '오뎅이',
                style: TextStyle(
                  fontSize: contextWidth * 0.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color for better contrast
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 메뉴 리스트 섹션 위젯
class MenuListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: contextWidth * 0.7,
        vertical: contextHeight * 0.2,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuItem('환경설정', onTap: () {}),
              Divider(color: Colors.grey.withOpacity(0.3)),
              _buildMenuItem('로그아웃', onTap: () {}),
              Divider(color: Colors.grey.withOpacity(0.3)),
              _buildMenuItem('질병 정보 등록', onTap: () {}),
              Divider(color: Colors.grey.withOpacity(0.3)),
              _buildMenuItem('가족 등록하기', onTap: () {}),
              Divider(color: Colors.grey.withOpacity(0.3)),
              _buildMenuItem('강아지 추가하기', onTap: () {}),
              Divider(color: Colors.grey.withOpacity(0.3)),
              _buildMenuItem('데이터 내보내기', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  // 메뉴 항목 빌더 메서드
  Widget _buildMenuItem(String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17.5,
            color: Colors.white.withOpacity(0.9), // White text color for better contrast
          ),
        ),
      ),
    );
  }
}

// About us 섹션 위젯
class AboutUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: contextWidth * 0.5,
        vertical: contextHeight * 0.1,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ListTile(
            title: Text(
              'About us',
              style: TextStyle(fontSize: 18, color: Colors.white), // White text color for better contrast
            ),
            onTap: () {
              // Show about us information
            },
          ),
        ),
      ),
    );
  }
}
