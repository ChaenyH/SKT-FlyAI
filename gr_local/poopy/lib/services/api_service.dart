// API 호출을 위한 서비스 클래스입니다.
// 이 클래스에서 HTTP 요청을 관리하며, 각 모델에 필요한 데이터를 서버에서 가져옵니다.

// lib/models/api_service.dart

import 'dart:convert';  // JSON 인코딩 및 디코딩을 위해 필요
import 'package:http/http.dart' as http;  // HTTP 요청을 위해 필요
import '../models/user_model.dart';  // UserModel을 사용하기 위해 필요
import '../models/dog_model.dart';  // DogModel을 사용하기 위해 필요

class ApiService {
  static const String baseUrl = 'http://223.194.44.32:8000/';

  // POST /users/signup
  Future<UserModel> signUpUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }

  // POST /users/login
  Future<UserModel> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  // POST /users/dog_signup
  Future<DogModel> signUpDog(String dogName, int dogSex, int dogSize, bool dogSpayed, bool dogPregnant) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/dog_signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'dogname': dogName,
        'dogsex': dogSex,
        'dogsize': dogSize,
        'dogspayed': dogSpayed,
        'dogpregnant': dogPregnant,
      }),
    );

    if (response.statusCode == 200) {
      return DogModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up dog');
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
}
