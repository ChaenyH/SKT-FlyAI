import 'package:flutter/material.dart';
import '../controllers/navigation_controller.dart';
import 'dart:ui';  // for ImageFilter

void showCustomLoginDialog(BuildContext context) {
  final double contextHeight = MediaQuery.of(context).size.height * 0.1;
  final double contextWidth = MediaQuery.of(context).size.width * 0.1;

  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),  // 다이얼로그 외부의 반투명 배경
    builder: (_) => Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: contextHeight * 1.5,
          horizontal: contextWidth * 0.5,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                // padding: const EdgeInsets.all(16.0),
                child: LoginScreen(),  // LoginScreen을 여기에 삽입
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationController _navController = NavigationController();

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: contextWidth * 0.8,
              vertical: contextHeight * 0.6,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/poopy_logo.png',
                  height: contextHeight,
                ),
                SizedBox(height: contextHeight * 0.2),
                Text(
                  '로그인하세요',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: contextHeight * 0.05),
                Text(
                  '우리 함께 Poopy해요!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: contextHeight * 0.3),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: contextWidth * 0.4,
                      vertical: contextHeight * 0.15,
                    ),
                  ),
                ),
                SizedBox(height: contextHeight * 0.2),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: contextWidth * 0.4,
                      vertical: contextHeight * 0.15,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // 비밀번호 표시/숨기기 기능 추가
                      },
                    ),
                  ),
                ),
                SizedBox(height: contextHeight * 0.3),
                ElevatedButton(
                  onPressed: () {
                    _navController.navigateToHome(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCE94D8).withOpacity(0.8),
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textStyle: TextStyle(fontSize: 18.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: contextWidth * 0.45,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: contextHeight * 0.3),
                Divider(),
                SizedBox(height: contextHeight * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Poopy가 처음이세요?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _navController.navigateToSignup(context);
                      },
                      child: Text(
                        '회원 가입',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}