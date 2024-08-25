import 'package:flutter/material.dart';

class PhotoPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.grey,
      child: Center(
        child: Text('Photo Preview', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
