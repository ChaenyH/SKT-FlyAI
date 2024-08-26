// lib/models/dog_model.dart

class Dog {
  final String dogName;
  final int dogAge;
  final int dogSex; // 0 = Female, 1 = Male
  final bool dogSpayed;
  final bool dogPregnant;

  Dog({
    required this.dogName,
    required this.dogAge,
    required this.dogSex,
    required this.dogSpayed,
    required this.dogPregnant,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      dogName: json['dogname'],
      dogAge: json['dogage'],
      dogSex: json['dogsex'],
      dogSpayed: json['dogspayed'],
      dogPregnant: json['dogpregnant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dogname': dogName,
      'dogage': dogAge,
      'dogsex': dogSex,
      'dogspayed': dogSpayed,
      'dogpregnant': dogPregnant,
    };
  }
}
