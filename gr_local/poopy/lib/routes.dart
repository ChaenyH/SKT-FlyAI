import 'package:flutter/material.dart';
import 'package:poopy/views/card_news_screen.dart';
import 'package:poopy/views/dog_signup_screen.dart';
import 'package:poopy/views/login_screen.dart';
import 'package:poopy/views/onboarding_screen.dart';
import 'package:poopy/views/signup_screen.dart';
import 'views/home_screen.dart';
import 'views/calendar_screen.dart';
import 'views/camera_screen.dart';
import 'views/mypage_screen.dart';
import 'views/chatbot_dialog.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => UserSignUpScreen());
      case '/dog_signup':
        return MaterialPageRoute(builder: (_) => DogSignUpScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case '/chatlog':
      //   return MaterialPageRoute(builder: (_) => ChatlogScreen());

      case '/calendar':
        return MaterialPageRoute(builder: (_) => CalendarScreen());

      case '/camera':
        return MaterialPageRoute(builder: (_) => CameraScreen());

      case '/mypage':
        return MaterialPageRoute(builder: (_) => MyPageScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
