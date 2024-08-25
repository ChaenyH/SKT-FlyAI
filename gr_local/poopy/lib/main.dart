// 앱의 진입점입니다. MaterialApp을 초기화하고, 앱의 전역 상태 및 라우팅을 설정합니다.

import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',  // 앱이 시작될 때 로그인 화면을 첫 화면으로 설정
      onGenerateRoute: Routes.generateRoute,
      // 필요에 따라 테마, 로컬라이제이션 등을 추가할 수 있습니다.
    );
  }
}
