import 'package:flutter/material.dart';
import 'package:poopy/views/dog_signup_screen.dart';
import '../controllers/user_controller.dart';
import '../controllers/navigation_controller.dart';
import '../services/api_service.dart';

class UserSignUpScreen extends StatefulWidget {
  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationController _navController = NavigationController();
  final UserController userController = UserController(
    apiService: ApiService(),
    navigationController: NavigationController(),
  );

  bool _isPasswordVisible = false; // 비밀번호 표시 여부를 위한 상태 변수

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(contextWidth * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/poopy_logo.png',
                width: contextWidth * 3,  // 로고 사이즈 조정
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                child: Text(
                  "회원가입",
                  style: TextStyle(
                    fontSize: contextWidth * 0.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.3),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.45,
                    vertical: contextHeight * 0.15,
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.2),
              TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible, // _isPasswordVisible 상태에 따라 비밀번호 숨김 처리
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.45,
                    vertical: contextHeight * 0.15,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // 비밀번호 표시/숨김 상태 토글
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.55),
              SizedBox(
                width: double.infinity,  // 너비를 최대화
                child: ElevatedButton(
                  onPressed: () {
                    userController.signUpUser(
                      context,
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.withOpacity(0.7),  // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),  // 버튼 모서리 곡선
                    ),
                    textStyle: TextStyle(fontSize: contextWidth * 0.5),
                    side: BorderSide(  // 테두리 설정
                      color: Colors.white.withOpacity(0.9),  // 테두리 색상
                      width: contextWidth * 0.05,  // 테두리 두께
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: contextWidth * 0.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.2),
              SizedBox(
                width: double.infinity,  // 너비를 최대화
                child: ElevatedButton(
                  onPressed: () {
                    _navController.navigateToDogSignup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCE94D8).withOpacity(0.8),
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),  // 버튼 모서리 곡선
                    ),
                    textStyle: TextStyle(fontSize: contextWidth * 0.5),
                    side: BorderSide(  // 테두리 설정
                      color: Colors.white.withOpacity(0.9),  // 테두리 색상
                      width: contextWidth * 0.05,  // 테두리 두께
                    ),
                  ),
                  child: Text(
                    '강아지 등록하기',
                    style: TextStyle(
                      fontSize: contextWidth * 0.35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '이미 계정이 있으신가요?',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: contextWidth * 0.35,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: contextWidth * 0.4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: contextHeight * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
