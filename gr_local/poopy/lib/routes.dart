import 'package:flutter/material.dart';
import 'package:poopy/views/homeScreen/chatlog_screen.dart';
import 'package:poopy/views/onboardingScreen/dog_signup_screen.dart';
import 'package:poopy/views/onboardingScreen/onboarding_screen.dart';
import 'package:poopy/views/onboardingScreen/user_signup_screen.dart';
import 'views/homeScreen/home_screen.dart';
import 'views/calendarScreen/calendar_screen.dart';
import 'views/cameraScreen/camera_screen.dart';
import 'views/mypageScreen/mypage_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => UserSignUpScreen());
      case '/dog_signup':
        return MaterialPageRoute(builder: (_) => DogSignUpScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/chatlog':
        return MaterialPageRoute(builder: (_) => ChatLogScreen());

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