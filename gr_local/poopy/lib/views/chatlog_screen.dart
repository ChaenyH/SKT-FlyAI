import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poopy/views/rive_background.dart';
import 'package:poopy/views/widgets/chat_message_widget.dart';


class ChatLogScreen extends StatefulWidget {
  @override
  _ChatLogScreenState createState() => _ChatLogScreenState();
}

class _ChatLogScreenState extends State<ChatLogScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> messages = [
    {
      "role": "assistant",
      "message": "대변 색상은 검은색(#2f2f2f)이며, 브리스톨 지수는 Type 1로, 변비와 같은 딱딱하고 건조한 상태입니다. 또한, 혈액은 존재하지 않습니다.",
      "timestamp": DateTime.parse("2024-08-18T15:28:40"),
    },
    {
      "role": "user",
      "message": "요즘 강아지가 변을 보기 좀 힘들어하기는 했어요.",
      "timestamp": DateTime.parse("2024-08-18T15:29:21"),
    },
    {
      "role": "assistant",
      "message": "그렇다면 변비가 원인일 수 있습니다. 물 섭취를 늘려주시고, 상황이 나아지지 않는다면 빠른 시일 내에 전문의의 진료를 받아보셔야 합니다.",
      "timestamp": DateTime.parse("2024-08-18T15:30:00"),
    },
    {
      "role": "assistant",
      "message": "대변 색상은 녹색(#4a7c3a)이며, 브리스톨 지수는 Type 7로, 완전히 물 같은 설사입니다.",
      "timestamp": DateTime.parse("2024-08-19T16:15:05"),
    },
    {
      "role": "user",
      "message": "네, 어제 새로운 간식을 줘봤어요.",
      "timestamp": DateTime.parse("2024-08-19T16:16:50"),
    },
    {
      "role": "assistant",
      "message": "새로운 간식이 원인일 수 있습니다.",
      "timestamp": DateTime.parse("2024-08-19T16:17:30"),
    },
    {
      "role": "assistant",
      "message": "대변 색상은 노란색(#e4a813)이며, 브리스톨 지수는 Type 6로, 약간 물기 있는 형태입니다. 또한, 혈액이 존재합니다.",
      "timestamp": DateTime.parse("2024-08-20T09:45:30"),
    },
    {
      "role": "user",
      "message": "네, 최근에 새로운 사료를 바꿔봤어요.",
      "timestamp": DateTime.parse("2024-08-20T09:47:10"),
    },
    {
      "role": "assistant",
      "message": "새로운 사료가 강아지의 소화에 영향을 미친 것 같습니다.",
      "timestamp": DateTime.parse("2024-08-20T09:48:30"),
    },
  ];

  @override
  void initState() {
    super.initState();
    // 화면이 렌더링된 후 스크롤을 맨 아래로 이동
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    DateTime? previousDate;

    return Scaffold(
      body: Stack(
        children: [
          const StalledBackground1(), // RiveBackground 추가
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 뒤로가기 버튼
              Padding(
                padding: EdgeInsets.only(
                    top: contextHeight * 0.4,
                    bottom: contextHeight * 0.1,
                    left: contextWidth * 0.2
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Container(
                height: contextHeight * 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7), // 반투명 배경색
                  borderRadius: BorderRadius.circular(16.0), // 모서리 둥글게
                  border: Border.all(
                    color: Colors.white.withOpacity(1), // 테두리 색상
                    width: contextWidth * 0.08,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: contextWidth * 0.3,
                  vertical: contextHeight * 0.1,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: contextWidth * 0.25,
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    DateTime currentDate = messages[index]['timestamp'];
                    bool showDate = previousDate == null ||
                        previousDate!.day != currentDate.day ||
                        previousDate!.month != currentDate.month ||
                        previousDate!.year != currentDate.year;

                    previousDate = currentDate;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (showDate)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: contextHeight * 0.4,
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFABA8A8).withOpacity(0.5),
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: contextWidth * 0.25,
                                  vertical: contextHeight * 0.08,
                                ),
                                child: Text(
                                  DateFormat(' yyyy년 MM월 dd일 ').format(currentDate),
                                  style: TextStyle(
                                    fontSize: contextWidth * 0.3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ChatMessageWidget(
                          text: messages[index]['message'],
                          isUserMessage: messages[index]['role'] == 'user',
                          timestamp: messages[index]['timestamp'],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}