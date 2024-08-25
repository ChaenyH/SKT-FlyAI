// 사용자 데이터 모델을 정의합니다.

// lib/models/user_model.dart

class UserModel {
  final int userId;
  final String email;
  final String accessToken;

  UserModel({
    required this.userId,
    required this.email,
    required this.accessToken,
  });

  // JSON 데이터를 UserModel 객체로 변환
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      email: json['email'],
      accessToken: json['access_token'],
    );
  }

  // UserModel 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'access_token': accessToken,
    };
  }
}
