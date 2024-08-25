import 'package:flutter/material.dart';

class CardNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120,
        child: ListTile(
          leading: Icon(Icons.article),
          title: Text('Card News'),
          onTap: () {
            Navigator.pushNamed(context, '/cardnews');
          },
        ),
      )
    );
  }
}