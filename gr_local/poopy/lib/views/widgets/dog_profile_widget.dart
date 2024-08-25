import 'package:flutter/material.dart';

class DogProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/dog_profile_1.png'), // 이미지 변경
          radius: 30,
        ),
        SizedBox(width: contextWidth * 0.4),
        Text(
          '오뎅이',
          style: TextStyle(fontSize: contextWidth * 0.5, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
