import 'package:flutter/material.dart';
import 'package:poopy/views/chatbotScreen/components/chat_message_widget.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // 배경을 반투명하게 설정
      body: Center(
        child: Container(
          height: contextHeight * 7.5,
          width: contextWidth * 9,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              // 상단 시간 표시
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: contextWidth * 0.8),
                  Text(
                    // 'Today ${DateFormat('h:mm a').format(DateTime.now())}',
                    'PuPpyT',
                    style: TextStyle(
                      fontSize: contextWidth * 0.4,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                  ),
                ],
              ),
              // 채팅 메시지 리스트
              Expanded(
                child: ListView(
                  children: [
                    ChatMessageWidget(
                      text: "대변 색상은 녹색(#4a7c3a)이며, 브리스톨 지수는 Type 7로, 완전히 물 같은 설사입니다. 또한, 혈액은 존재하지 않습니다. 이러한 정보는 감염이나 식이 변화로 인한 장의 급격한 반응을 시사할 수 있습니다. 강아지가 최근에 새로운 음식을 먹었거나 외부에서 무엇인가를 섭취한 적이 있나요? 이 정보를 통해 강아지의 상태를 더 잘 이해하고 적절한 조치를 취하는 데 도움이 될 수 있습니다.",
                      isUserMessage: false,
                      timestamp: DateTime.now(),
                    ),
                    // ChatMessageWidget(
                    //   text: "안녕하세요! 만나서 반갑습니다.",
                    //   isUserMessage: true,
                    //   timestamp: DateTime.now(),
                    // ),
                    // 여기에 더 많은 메시지를 추가할 수 있음
                  ],
                ),
              ),
              SizedBox(height: contextHeight * 0.1),
              // 메시지 입력 필드
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: contextWidth * 6.5,
                    height: contextHeight * 0.6,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: " 메시지를 입력하세요...",
                        hintStyle: TextStyle(
                          color: Color(0xFFC2C2C2),
                          fontSize: contextWidth * 0.35
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: contextWidth * 0.1),
                  ElevatedButton(
                    onPressed: () {
                      // 메시지 전송 로직 추가
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF9877E2).withOpacity(0.7),
                      shape: CircleBorder(),  // 버튼을 원형으로 만듭니다
                      padding: EdgeInsets.all(contextWidth * 0.3),  // 버튼 아이콘 색상을 설정합니다
                    ),
                    child: Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3), // 반투명 배경 설정
    builder: (BuildContext context) {
      return CustomDialog();
    },
  );
}
