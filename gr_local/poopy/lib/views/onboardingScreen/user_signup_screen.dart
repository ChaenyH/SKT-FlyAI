import 'package:flutter/material.dart';
import '../../controllers/api_service.dart';
import '../../controllers/navigation_controller.dart';

class UserSignUpScreen extends StatefulWidget {
  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationController _navController = NavigationController();
  final ApiService apiService = ApiService();

  bool _isPasswordVisible = false; // 비밀번호 표시 여부를 위한 상태 변수

  Future<void> _showDogRegistrationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 다이얼로그 바깥을 누르면 닫히지 않도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '강아지도 등록하시겠어요?',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('예',
                  style: TextStyle(fontWeight: FontWeight.w700)
              ),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                _navController.navigateToDogSignup(context); // 강아지 등록 화면으로 이동
              },
            ),
            TextButton(
              child: Text('아니요'),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                _navController.navigateToLogin(context); // 로그인 화면으로 이동
              },
            ),
          ],
        );
      },
    );
  }

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
                  onPressed: () async {
                    try {
                      await apiService.signupUser(
                        emailController.text,
                        passwordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('회원가입이 성공적으로 완료되었습니다!')),
                      );
                      await _showDogRegistrationDialog(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('회원가입에 실패했습니다. 다시 시도해주세요.\n$e')),
                      );
                    }
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
              SizedBox(height: contextHeight * 1),
            ],
          ),
        ),
      ),
    );
  }
}
