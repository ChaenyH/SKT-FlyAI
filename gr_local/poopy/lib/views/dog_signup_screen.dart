import 'package:flutter/material.dart';
import 'package:poopy/controllers/dog_controller.dart';
import '../controllers/navigation_controller.dart';
import '../services/api_service.dart';

class DogSignUpScreen extends StatefulWidget {
  @override
  _DogSignUpScreenState createState() => _DogSignUpScreenState();
}

class _DogSignUpScreenState extends State<DogSignUpScreen> {
  final TextEditingController dogNameController = TextEditingController();
  final TextEditingController dogAgeController = TextEditingController();
  bool isDogSpayed = false;
  bool isDogPregnant = false;

  // 성별 변수 선언
  String? dogSex;  // null을 허용하여 선택되지 않은 초기 상태를 처리

  final DogController dogController = DogController(
    apiService: ApiService(),
    navigationController: NavigationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dog Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('skip'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextField(
                  controller: dogNameController,
                  decoration: InputDecoration(
                    labelText: 'Dog Name',
                  ),
                ),
                TextField(
                  controller: dogAgeController,
                  decoration: InputDecoration(
                    labelText: 'Dog Age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                // 성별 선택 라디오 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dog Sex"),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: dogSex,
                          onChanged: (String? value) {
                            setState(() {
                              dogSex = value;
                            });
                          },
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: dogSex,
                          onChanged: (String? value) {
                            setState(() {
                              dogSex = value;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                SwitchListTile(
                  title: Text('Dog Spayed'),
                  value: isDogSpayed,
                  onChanged: (bool value) {
                    setState(() {
                      isDogSpayed = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Dog Pregnant'),
                  value: isDogPregnant,
                  onChanged: (bool value) {
                    setState(() {
                      isDogPregnant = value;
                    });
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    int dogAge = int.tryParse(dogAgeController.text) ?? 0;

                    if (dogSex == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select the dog\'s sex'),
                        ),
                      );
                      return;
                    }

                    dogController.signUpDog(
                      context,
                      dogNameController.text,
                      dogAge,
                      dogSex == 'Male' ? 1 : 2,  // 숫자로 변환하여 API에 전달
                      isDogSpayed,
                      isDogPregnant,
                    );
                  },
                  child: Text('SIGN UP'),
                ),
              ]
          ),
        )
    );
  }
}
