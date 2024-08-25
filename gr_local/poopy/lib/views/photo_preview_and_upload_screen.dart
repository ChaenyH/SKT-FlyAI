import 'dart:io';
import 'package:flutter/material.dart';

class PhotoPreviewAndUploadScreen extends StatelessWidget {
  final String imagePath;

  PhotoPreviewAndUploadScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 검은색으로 설정
      appBar: AppBar(
        backgroundColor: Colors.black, // 앱바 배경색을 검은색으로 설정
        title: Text('Photo Preview', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false, // 자동으로 뒤로 가기 버튼 생성 안함
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: contextWidth * 0.5),
            child: SizedBox(
              height: contextHeight * 0.6,  // 버튼 높이 설정
              child:ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);  // 다시 카메라로 돌아가기
                },
                icon: Icon(Icons.camera, color: Colors.black),
                label: Text('Retake', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 흰색 배경
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: contextWidth * 0.5,
                vertical: contextHeight * 0.3,
              ),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: contextHeight * 0.3,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: contextWidth * 0.5,
            ),
            child: SizedBox(
              width: double.infinity,
              height: contextHeight * 0.6,  // 버튼 높이 설정
              child: ElevatedButton.icon(
                onPressed: () {
                  // 업로드 로직을 추가하세요.
                  // 예시: Navigator.pushNamed(context, '/upload', arguments: imagePath);
                },
                icon: Icon(Icons.cloud_upload),
                label: Text('Upload'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white, // 흰색 배경
                ),
              ),
            ),
          ),
          SizedBox(height: contextHeight * 0.5,)
        ],
      ),
    );
  }
}
