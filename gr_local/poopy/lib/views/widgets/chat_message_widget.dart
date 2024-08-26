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
      padding: EdgeInsets.symmetric(
          horizontal: contextWidth * 0.1,
          vertical: contextHeight * 0.08,
      ),
      child: Column(
        crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.2),
            child: Text(
              DateFormat('h:mm a').format(timestamp), // 시간을 h:mm a 포맷으로 표시
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: contextWidth * 0.3
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isUserMessage ? Color(0xFFC2C2C2) : Color(0xFF9877E2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: isUserMessage ? Radius.circular(16) : Radius.zero,
                bottomRight: isUserMessage ? Radius.zero : Radius.circular(16),
              ),
            ),
            padding: EdgeInsets.all(12),
            child: Text(
              text,
              style: TextStyle(
                // color: isUserMessage ? Colors.black : Colors.white,
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
