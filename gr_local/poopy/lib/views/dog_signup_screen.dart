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
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // 뒤로가기 버튼
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(contextWidth * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/poopy_logo.png',
                width: contextWidth * 3,  // 로고 사이즈 조정
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
                child: Text(
                  "강아지 정보 입력",
                  style: TextStyle(
                    fontSize: contextWidth * 0.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.3),
              TextField(
                controller: dogNameController,
                decoration: InputDecoration(
                  labelText: '강아지 이름',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.45,
                    vertical: contextHeight * 0.15,
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.2),
              TextField(
                controller: dogAgeController,
                decoration: InputDecoration(
                  labelText: '강아지 나이',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.45,
                    vertical: contextHeight * 0.15,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: contextHeight * 0.3),
              // 성별 선택 라디오 버튼
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: contextWidth * 0.4,
                  vertical: contextHeight * 0.05
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "강아지 성별",
                      style: TextStyle(fontSize: contextWidth * 0.4),
                    ),
                    SizedBox(width: contextWidth * 0.1,),
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
                        Text('수컷', style: TextStyle(fontSize: contextWidth * 0.35)),
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
                        Text('암컷', style: TextStyle(fontSize: contextWidth * 0.35)),
                      ],
                    ),
                    SizedBox(width: contextWidth * 0.1,)
                  ],
                ),
              ),
              SwitchListTile(
                title: Text(
                  '중성화 여부',
                  style: TextStyle(fontSize: contextWidth * 0.4),
                ),
                value: isDogSpayed,
                onChanged: (bool value) {
                  setState(() {
                    isDogSpayed = value;
                  });
                },
                activeColor: Colors.purple,
              ),
              SwitchListTile(
                title: Text(
                  '임신 여부',
                  style: TextStyle(fontSize: contextWidth * 0.4),
                ),
                value: isDogPregnant,
                onChanged: (bool value) {
                  setState(() {
                    isDogPregnant = value;
                  });
                },
                activeColor: Colors.purple,
              ),
              SizedBox(height: contextHeight * 0.55),
              SizedBox(
                width: double.infinity,  // 너비를 최대화
                child: ElevatedButton(
                  onPressed: () {
                    int dogAge = int.tryParse(dogAgeController.text) ?? 0;

                    if (dogSex == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('강아지의 성별을 입력해주세요!'),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.withOpacity(0.8),  // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: contextHeight * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),  // 버튼 모서리 곡선
                    ),
                    textStyle: TextStyle(fontSize: contextWidth * 0.5),
                    side: BorderSide(  // 테두리 설정
                      color: Colors.white.withOpacity(0.9),  // 테두리 색상
                      width: contextWidth * 0.05,  // 테두리 두께
                    ),
                  ),
                  child: Text(
                    '등록하기',
                    style: TextStyle(
                      fontSize: contextWidth * 0.4,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: contextHeight * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
