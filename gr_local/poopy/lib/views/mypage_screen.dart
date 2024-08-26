import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';
import 'package:poopy/views/widgets/mypage_widgets.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        // title: Text('MyPageScreen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(contextWidth * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(), // 모듈화한 프로필 섹션 사용
            SizedBox(height: contextHeight * 0.2),
            MenuListSection(), // 모듈화한 메뉴 리스트 섹션 사용
            SizedBox(height: contextHeight * 0.2),
            AboutUsSection(), // 모듈화한 About us 섹션 사용
          ],
        ),
      ),
      floatingActionButton: GlobalExpandableFab(),
    );
  }
}