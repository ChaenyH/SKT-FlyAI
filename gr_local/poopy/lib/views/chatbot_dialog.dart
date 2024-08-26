import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poopy/views/widgets/chat_message_widget.dart';

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
                    'Today ${DateFormat('h:mm a').format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: 14,
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
              // SizedBox(height: contextHeight * 0.1),
              // 채팅 메시지 리스트
              Expanded(
                child: ListView(
                  children: [
                    ChatMessageWidget(
                      text: "안녕하세요! 무엇을 도와드릴까요?",
                      isUserMessage: false,
                      timestamp: DateTime.now(),
                    ),
                    ChatMessageWidget(
                      text: "안녕하세요! 만나서 반갑습니다.",
                      isUserMessage: true,
                      timestamp: DateTime.now(),
                    ),
                    // 여기에 더 많은 메시지를 추가할 수 있음
                  ],
                ),
              ),
              SizedBox(height: contextHeight * 0.1),
              // 메시지 입력 필드
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "메시지를 입력하세요...",
                        hintStyle: TextStyle(color: Color(0xFFC2C2C2)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: contextWidth * 0.2),
                  ElevatedButton(
                    onPressed: () {
                      // 메시지 전송 로직 추가
                    },
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
