import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../controllers/navigation_controller.dart';
import '../models/api_service.dart';

class LoginScreen extends StatelessWidget {
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
        title: Text('Login'),
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
                  userController.loginUser(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navController.navigateToSignup(context);
                },
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navController.navigateToHome(context);
                },
                child: Text('Go Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
