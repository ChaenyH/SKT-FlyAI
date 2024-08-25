import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../controllers/navigation_controller.dart';
import '../models/api_service.dart';

class UserSignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationController _navController = NavigationController();

  final UserController userController = UserController(
    apiService: ApiService(),
    navigationController: NavigationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // 뒤로가기 버튼 모양
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  userController.signUpUser(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Sign Up'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navController.navigateToDogSignup(context);
                },
                child: Text('Dog Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
