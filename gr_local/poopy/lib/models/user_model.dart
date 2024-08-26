// lib/models/user_model.dart

import 'dog_model.dart';

class User {
  final int userId;
  final String email;
  final Dog? dogInfo; // 개 정보를 포함할 수 있도록 Dog 모델을 참조

  User({
    required this.userId,
    required this.email,
    this.dogInfo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      email: json['email'],
      dogInfo: json['dog_info'] != null ? Dog.fromJson(json['dog_info']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'dog_info': dogInfo?.toJson(),
    };
  }
}
