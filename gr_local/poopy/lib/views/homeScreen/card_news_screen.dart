import 'package:flutter/material.dart';

class CardNewsScreen extends StatelessWidget {
  final int index;

  CardNewsScreen({required this.index});

  final List<Map<String, dynamic>> pages = [
    {
      'title': '초보 보호자분도 키우기 쉬운 강아지는 어떤 강아지?',
      'content': '''
강아지를 입양하기 전에는 생각보다 많은 부분을 고려해봐야 해요.
'얼굴이 귀여워서', '외모가 제일 좋아서'라는 이유로 선택하려고 하면 막상 생각했던 것과 다른 반려 생활에 당황할 수 있습니다.
그렇게 되지 않기 위해서라도 처음 반려 생활을 시작하려는 분들은 강아지를 선택할 때에는 아래 사항도 판단 기준에 넣어 신중하게 고려하는 것이 중요해요.

ㅁ 털빠짐이 많은지 적은지
ㅁ 짖는 소리가 심한지 아닌지
ㅁ 미용 케어는 어느 정도 해야 하는지
ㅁ 필요한 운동량이 보호자의 성향과 맞는지
ㅁ 훈련에 들어가기 쉬운지
ㅁ 걸리기 쉬운 병이나 유전적 질환이 많은지
ㅁ 활발한지 차분한지 기본 견종 성격

외형이나 취향도 중요하게 생각하는 분들이 있겠지만 반려 생활은 십수 년 동안 계속되는 것이기 때문에 가장 중요한 것은 함께 생활하는 데 있어서 문제가 될 만한 항목에 대해서도 체크해보는 것입니다.
그러면 초보 보호자분도 반려 생활을 수월하게 할 수 있다고 알려진 강아지들을 소개할게요~!
물론 강아지들도 개체마다 성향이 모두 다르니 참고로 해주세요.:)

출처: 로얄동물메디컬센터(https://blog.naver.com/royalamc7582)
''',
      'image': 'assets/images/cardnews1.jpg',
    },
    {
      'title': '내가 먹는 유산균, 강아지와 나눠 먹어도 될까? 반려동물 ‘유산균’ 궁금증 6가지',
      'content': '''
Q-1. 반려동물도 유산균 복용 필요할까?
체내 면역 세포의 약 70%가 장에 분포하고 있기 때문에 면역력을 키우기 위해서는 장이 건강해야 합니다. 사람과 마찬가지로 개와 고양이의 장내에도 수조~수백조의 미생물이 서식하고 있습니다. 면역 기능 향상 및 소화불량, 변비, 설사 등 주로 소화기증상의 예방이나 개선을 목적으로 섭취하는 '유산균’은 동물 건강에도 도움을 줍니다.

Q-2. 반려동물에게 사람 유산균 먹여도 괜찮을까?
사람과 동물의 종간차이, 생활환경이나 장내환경의 차이로 인해 서식하는 균종에는 다소 차이가 있습니다. 사람에게는 효과가 좋은 유산균 제품이라도 개나 고양이에게는 효과가 전혀 없거나 경우에 따라서는 사람 제품에 들어 있는 첨가제로 인해 부작용이 나타날 수 있어, 반려동물 전용 유산균을 권장합니다.

Q-3. 반려동물 유산균, 몇 살부터 먹여야 할까?
기본적으로 반려동물용 프로바이오틱스 제품은 전연령용으로 나오고 있지만, 균종이나 균수에 따라 복용 권고 연령대가 다르기 때문에, 제품별 복용 가능 연령을 꼭 확인해야 합니다. 특히 어린 반려동물이라면 주의가 필요한데요, 생후 1개월령 미만의 강아지나 고양이는 아주 적은 양부터 주기 시작해 이상반응의 여부를 살피는 것이 좋습니다.

Q-4. 동물 유산균수, 높을수록 좋을까?
사람의 경우, 건강에 도움을 줄 수 있는 적정 유산균 수가 어느 정도 표준화되어 있는 반면, 개나 고양이는 유산균수에 따른 효능·효과에 대한 연구가 부족해 적정한 수가 얼마인지 명시된 것이 없는데요, 사람의 프로바이오틱스 섭취량을 참고했을 때, 1억~10억 마리 정도를 권장하나, 반려동물의 반응에 따라 섭취량을 조절해 주세요!

출처: 헬스조선 카드뉴스팀(https://health.chosun.com)
''',
      'images': [
        'assets/images/cardnews2.jpg',
        'assets/images/cardnews2-1.jpg',
        'assets/images/cardnews2-2.jpg',
      ],
    },
    {
      'title': '산책하며 반려견 건강 확인하는 법은?',
      'content': '''
3월 23일은 국제 강아지의 날이다. 세계 모든 강아지를 사랑하며 보호하는 것은 물론, 유기견 입양 문화를 정착시키자는 취지로 제정된 날이다.

국제 강아지의 날을 맞이해 산책하며 쉽게 반려견의 건강을 확인할 수 있는 법에 대해 알아보자.


[ 대변 상태로 알아보는 반려견 건강 상태 ]

사람도 대변 상태를 통해 건강을 확인하듯 반려견도 변 상태를 통해 건강을 확인할 수 있다. 강아지마다 다르지만 배변 횟수는 보통 하루 1~4회, 너무 무르지 않고 갈색을 띠는 것이 건강한 상태이다.

◆ 혈변
변비이거나 대장, 항문 주변에 출혈이 발생해 혈변을 볼 수 있다. 그러나 피가 많이 섞여있다면 그 즉시 병원에 내원해야 한다.

◆ 노란색 변
소화 불량이 있거나 간 질환이 있을 때 노란 변이 나올 수 있다. 사료나 간식을 바꾼 후 노란 변이 나온다면 바꾼 제품이 반려견에게 맞지 않는 것은 아닌지 확인이 필요하다. 

◆ 검은 변
소장에 출혈이 있거나 궤양성 출혈 가능성이 있다.

◆ 초록색 변
산책하며 풀을 많이 먹으면 초록색 변을 볼 수도 있으나 이런 경우보다는 소화를 위해 분비되는 액인 담즙이 그대로 배설 되었을 가능성이 높다. 소화 불량이나 장 운동이 빨라져 나오는 경우인데, 한 번 본다면 문제 없으나 반복 된다면 병원에 내원이 필요하다.


[ 소변 상태로 알아보는 반려견 건강 상태 ]

평소 연한 노란빛을 띠는 것이 문제 없는 상태이다.

◆ 투명한 색
물을 많이 섭취하면 투명하게 나올 수는 있으나 이보다는 당뇨, 신장 질환, 호르몬 질환일 가능성이 있다.

◆ 혈뇨
매우 위험한 상태로 즉시 병원에 내원해야 한다. 가정에서 양파를 먹었거나 방광염, 결석이 있으면 혈뇨가 발생할 수 있다. 암컷 강아지일 경우 생리로 인한 혈뇨가 있을 수 있으나 생리가 아님에도 피가 보인다면 최대한 빠르게 병원에 방문하도록 한다.

출처 : 매경헬스(http://www.mkhealth.co.kr)
''',
      'images': [
        'assets/images/cardnews3.jpg',
        'assets/images/cardnews3-1.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    final page = pages[index];
    return Scaffold(
      appBar: AppBar(
        title: Text("Card News"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              page['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: contextHeight * 0.2),
            if (page['image'] != null)
              Center( // 이미지를 가운데로 배치
                child: Image.asset(
                  page['image'],
                  fit: BoxFit.cover,
                  width: contextWidth * 7,
                ),
              ),
            if (page['images'] != null)
              ...page['images'].map<Widget>((imagePath) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center( // 이미지를 가운데로 배치
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: contextWidth * 7,
                    ),
                  ),
                );
              }).toList(),
            SizedBox(height: contextHeight * 0.5),
            Text(
              page['content'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
