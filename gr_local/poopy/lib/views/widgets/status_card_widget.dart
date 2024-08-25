import 'package:flutter/material.dart';

class StatusCardWidget extends StatelessWidget {
  final String title;

  StatusCardWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        child: ListTile(
          title: Text(title),
        ),
      )
    );
  }
}
