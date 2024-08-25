// 사용자 관련 로직을 처리하는 컨트롤러입니다.
// 예를 들어, 로그인, 회원가입, 사용자 데이터 처리 등의 기능이 포함됩니다.

import 'package:flutter/material.dart';
import '../models/api_service.dart';
import '../models/user_model.dart';
import 'navigation_controller.dart';

// 이 클래스에서는 회원가입 및 로그인 API 호출을 처리하고,
// 그 결과에 따라 네비게이션을 관리합니다.

class UserController {
  final ApiService apiService;
  final NavigationController navigationController;

  UserController({
    required this.apiService,
    required this.navigationController,
  });

  // 사용자 회원가입 처리
  Future<void> signUpUser(BuildContext context, String email, String password) async {
    try {
      UserModel user = await apiService.signUpUser(email, password);
      // 회원가입이 성공하면 홈 화면으로 이동
      navigationController.navigateToHome(context);
    } catch (e) {
      _showErrorDialog(context, 'Sign up failed', e.toString());
    }
  }

  // 사용자 로그인 처리
  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      UserModel user = await apiService.loginUser(email, password);
      // 로그인이 성공하면 홈 화면으로 이동
      navigationController.navigateToHome(context);
    } catch (e) {
      _showErrorDialog(context, 'Login failed', e.toString());
    }
  }

  // 에러 다이얼로그 표시
  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
