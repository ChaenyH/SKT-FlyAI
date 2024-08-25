import 'package:flutter/material.dart';
import '../controllers/navigation_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(
              "Hello!\nWe are Poopy!",
              style: TextStyle(
                fontSize: 32
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 시작하기 버튼 클릭 시 로그인 화면으로 이동
                  _navController.navigateToLogin(context);
                },
                child: Text('시작하기'),
              ),
            ),
          ]
        )
      )
    );
  }
}
