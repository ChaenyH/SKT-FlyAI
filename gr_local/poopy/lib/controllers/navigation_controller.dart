// 사용자 동작에 따른 화면 간의 네비게이션 로직을 처리하는 역할을 합니다.

// 예를 들어, 사용자의 특정 행동에 따라 화면을 전환하거나,
// 네비게이션 스택을 제어하는 로직을 포함할 수 있습니다.
// 특정 이벤트가 발생할 때(예: 로그인 버튼 클릭) 이 컨트롤러를 통해 네비게이션이 처리됩니다.

import 'package:flutter/material.dart';

class NavigationController {
    // 로그인 화면으로 이동
    void navigateToLogin(BuildContext context) {
      Navigator.pushNamed(context, '/login');
    }

    // 회원가입 화면으로 이동
    void navigateToSignup(BuildContext context) {
      Navigator.pushNamed(context, '/signup');
    }

    // 홈 화면으로 이동
    void navigateToHome(BuildContext context) {
      Navigator.pushReplacementNamed(context, '/home');
    }

    // 홈 화면으로 이동
    void navigateToCalendar(BuildContext context) {
      Navigator.pushReplacementNamed(context, '/calendar');
    }

    // 카메라 화면으로 이동
    void navigateToCamera(BuildContext context) {
      Navigator.pushNamed(context, '/camera');
    }

    // 챗봇 화면으로 이동
    void navigateToChatbot(BuildContext context) {
      Navigator.pushReplacementNamed(context, '/chatbot');
    }


    // 챗봇 화면으로 이동
    void navigateToChatlog(BuildContext context) {
      Navigator.pushNamed(context, '/chatlog');
    }

    // 강아지 회원가입 화면으로 이동
    void navigateToDogSignup(BuildContext context) {
      Navigator.pushNamed(context, '/dog_signup');
    }

    // 화면 간의 인자 전달 가능 예시
    void navigateToPhotoPreview(BuildContext context) {
      Navigator.pushNamed(context, '/photo_preview');
  }
}
