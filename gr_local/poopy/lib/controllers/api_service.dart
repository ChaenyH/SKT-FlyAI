// API 호출을 위한 서비스 클래스입니다.
// 이 클래스에서 HTTP 요청을 관리하며, 각 모델에 필요한 데이터를 서버에서 가져옵니다.

// lib/controllers/api_service.dart

import 'dart:convert';  // JSON 인코딩 및 디코딩을 위해 필요
import 'package:http/http.dart' as http;  // HTTP 요청을 위해 필요

class ApiService {
  static const String baseUrl = 'http://223.194.44.32:8000/';

  // POST /users/signup
  Future<void> signupUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Signup successful: ${data['message']}');
      print('User ID: ${data['user_id']}');
    } else {
      print('Failed to signup: ${response.statusCode}');
    }
  }


  // POST /users/login
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // 로그인 성공 시, 필요한 데이터 저장 (예: 토큰, 사용자 정보)
      final data = jsonDecode(response.body);
      print('Login successful: User ID ${data['user_id']}');
      return true;
    } else {
      // 로그인 실패 시
      print('Failed to login: ${response.statusCode}');
      return false;
    }
  }


  // GET /users/
  Future<void> getUserInfo(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$userId'),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('User Info: ${data['email']}');
      print('Dog Info: ${data['dog_info']}');
    } else {
      print('Failed to get user info: ${response.statusCode}');
    }
  }


  // POST /users/dog_signup
  Future<void> signupDog(int userId, String dogName, int dogAge, int dogSex, bool dogSpayed, bool dogPregnant) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/dog_signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': userId,
        'dogname': dogName,
        'dogage': dogAge,
        'dogsex': dogSex,
        'dogspayed': dogSpayed,
        'dogpregnant': dogPregnant,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Dog Signup successful: ${data['dogname']}');
    } else {
      print('Failed to signup dog: ${response.statusCode}');
    }
  }


  // GET /users/dog_info
  Future<void> getDogInfo(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/dog_info?user_id=$userId'),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Dog Info: $data');
    } else {
      print('Failed to get dog info: ${response.statusCode}');
    }
  }


  // POST /chatgpt/chat
  Future<String> chatWithBot(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chatgpt/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['response'];  // 서버에서 온 응답을 문자열로 반환
    } else {
      throw Exception('Failed to chat with bot');
    }
  }


  // GET /chatgpt/chatlogs
  Future<void> getChatLogs(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/chatgpt/chatlogs?user_id=$userId'),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Chat Logs: $data');
    } else {
      print('Failed to get chat logs: ${response.statusCode}');
    }
  }


}


