import 'package:flutter/material.dart';

class ChatMessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Today 3:25 PM'),
          subtitle: Text('Chatbot message here'),
        ),
        ListTile(
          title: Text('User message here'),
          subtitle: Text('Today 3:26 PM'),
        ),
      ],
    );
  }
}
