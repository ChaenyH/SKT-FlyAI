import 'package:flutter/material.dart';

// 프로필 섹션 위젯
class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Container(
      padding: EdgeInsets.all(contextWidth * 0.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/dog_profile_1.png'), // 강아지 사진 경로
          ),
          SizedBox(width: 16.0),
          Text(
            '오뎅이',
            style: TextStyle(
              fontSize: contextWidth * 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
        vertical: contextHeight * 0.3,
        horizontal: contextWidth * 0.7,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuItem('환경설정', onTap: () {}),
          Divider(),
          _buildMenuItem('로그아웃', onTap: () {}),
          Divider(),
          _buildMenuItem('질병 정보 등록', onTap: () {}),
          Divider(),
          _buildMenuItem('가족 등록하기', onTap: () {}),
          Divider(),
          _buildMenuItem('강아지 추가하기', onTap: () {}),
          Divider(),
          _buildMenuItem('데이터 내보내기', onTap: () {}),
        ],
      ),
    );
  }

  // 메뉴 항목 빌더 메서드
  Widget _buildMenuItem(String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0),
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

    return Container(
      padding: EdgeInsets.all(contextWidth * 0.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ListTile(
        title: Text('About us'),
        onTap: () {
          // Show about us information
        },
      ),
    );
  }
}
