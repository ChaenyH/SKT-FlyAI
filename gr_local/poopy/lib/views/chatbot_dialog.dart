import 'package:flutter/material.dart';

class ChatbotDialog extends StatelessWidget {
  final String message;

  ChatbotDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Center(
        child: Text('Bot: $message'),
      ),
    );
  }
}
