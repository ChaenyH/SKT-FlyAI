// 강아지 관련 데이터 모델을 정의합니다.

// lib/models/dog_model.dart

class DogModel {
  final int dogId;
  final String dogName;
  final int dogAge;
  final int dogSex;
  final bool dogSpayed;
  final bool dogPregnant;

  DogModel({
    required this.dogId,
    required this.dogName,
    required this.dogAge,
    required this.dogSex,
    required this.dogSpayed,
    required this.dogPregnant,
  });

  // JSON 데이터를 DogModel 객체로 변환
  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      dogId: json['dog_id'],
      dogName: json['dogname'],
      dogAge: json['dogage'],
      dogSex: json['dogsex'],
      dogSpayed: json['dogspayed'],
      dogPregnant: json['dogpregnant'],
    );
  }

  // DogModel 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'dog_id': dogId,
      'dogname': dogName,
      'dogage': dogAge,
      'dogsex': dogSex,
      'dogspayed': dogSpayed,
      'dogpregnant': dogPregnant,
    };
  }
}
