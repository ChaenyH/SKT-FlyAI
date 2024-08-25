import 'package:flutter/material.dart';

class DogProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/dog_avatar.png'), // 이미지 변경
          radius: 30,
        ),
        SizedBox(width: 20),
        Text(
          'Bella',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
