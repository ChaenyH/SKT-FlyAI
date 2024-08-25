import 'package:flutter/material.dart';

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
