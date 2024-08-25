// 강아지 관련 로직을 처리하는 컨트롤러입니다.

import 'package:flutter/material.dart';
import '../models/api_service.dart';
import '../models/dog_model.dart';
import 'navigation_controller.dart';

// 이 클래스에서는 강아지 회원가입 API 호출을 처리하고,
// 그 결과에 따라 네비게이션을 관리합니다.

class DogController {
  final ApiService apiService;
  final NavigationController navigationController;

  DogController({
    required this.apiService,
    required this.navigationController,
  });

  // 강아지 회원가입 처리
  Future<void> signUpDog(BuildContext context, String dogName, int dogAge, int dogSex, bool dogSpayed, bool dogPregnant) async {
    try {
      DogModel dog = await apiService.signUpDog(dogName, dogAge, dogSex, dogSpayed, dogPregnant);
      // 강아지 회원가입이 성공하면 홈 화면으로 이동
      navigationController.navigateToHome(context);
    } catch (e) {
      _showErrorDialog(context, 'Dog Sign up failed', e.toString());
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
