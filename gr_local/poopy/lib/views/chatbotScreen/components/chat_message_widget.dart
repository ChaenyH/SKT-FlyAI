import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final bool isUserMessage;
  final DateTime timestamp;

  ChatMessageWidget({
    required this.text,
    required this.isUserMessage,
    required this.timestamp
  });

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Padding(
      padding: EdgeInsets.only(
        left: isUserMessage ? contextWidth * 2 : contextWidth * 0.1,
        right: isUserMessage ? contextWidth * 0.1 : contextWidth * 2,
        top: contextHeight * 0.08,
        bottom: contextHeight * 0.08,
      ),
      child: Column(
        crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.27),
            child: Text(
              isUserMessage
                  ? 'USER  ${DateFormat('h:mm a').format(timestamp)}'
                  : '${DateFormat('h:mm a').format(timestamp)}  BOT',
              style: TextStyle(
                color: Colors.grey,
                fontSize: contextWidth * 0.27,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isUserMessage ? Color(0xFFABA8A8) : Color(0xFF9877E2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: isUserMessage ? Radius.circular(16) : Radius.zero,
                bottomRight: isUserMessage ? Radius.zero : Radius.circular(16),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: contextWidth * 0.4,
              vertical: contextHeight * 0.15,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: contextWidth * 0.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInputWidget extends StatelessWidget {
  final Function(String) onSend;

  MessageInputWidget({required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // 예시 메시지 전송
              onSend('Example message');
            },
          ),
        ],
      ),
    );
  }
}
