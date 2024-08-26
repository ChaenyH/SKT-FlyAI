import 'dart:io';
import 'package:flutter/material.dart';
import '../chatbot_dialog.dart';

class PhotoPreviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return AppBar(
      backgroundColor: Colors.black,
      title: Text('Photo Preview', style: TextStyle(color: Colors.white)),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: contextWidth * 0.5),
          child: ElevatedButton.icon(
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
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class PhotoPreviewImage extends StatelessWidget {
  final String imagePath;

  const PhotoPreviewImage({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Expanded(
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
    );
  }
}

class UploadService {
  Future<bool> uploadImage(String imagePath) async {
    // 여기에 업로드 로직을 추가하세요.
    // 예: http POST 요청으로 이미지를 서버에 업로드.
    // 업로드가 성공하면 true 반환, 실패하면 false 반환.
    await Future.delayed(Duration(seconds: 1)); // 예시로 1초 지연
    return true; // 예시로 성공했다고 가정.
  }
}

class UploadButton extends StatelessWidget {
  final VoidCallback onPressed;

  UploadButton({required this.onPressed});

  final UploadService _uploadService = UploadService();

  Future<void> _handleUpload(BuildContext context) async {
    // 로딩 애니메이션을 보여줍니다.
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // 2초 후 업로드 진행
    await Future.delayed(Duration(seconds: 2));

    // 업로드 작업
    bool isUploaded = await _uploadService.uploadImage('your_image_path');

    // 로딩 애니메이션 닫기
    Navigator.of(context).pop();

    if (isUploaded) {
      // 캘린더 화면으로 이동
      Navigator.pushReplacementNamed(context, '/calendar');

      // 챗봇이 필요한 상황이라면 챗봇 다이얼로그 띄우기
      bool isChatbotNeeded = true; // 여기에 챗봇이 필요한 조건을 추가하세요.
      if (isChatbotNeeded) {
        showCustomDialog(context);
      }
    } else {
      // 업로드 실패 시 에러 메시지를 표시하거나 다른 처리를 합니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image upload failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: contextWidth * 0.5,
      ),
      child: SizedBox(
        width: double.infinity,
        height: contextHeight * 0.7,
        child: ElevatedButton.icon(
          onPressed: () => _handleUpload(context),
          icon: Icon(Icons.cloud_upload),
          label: Text(
            'Upload',
            style: TextStyle(fontSize: contextWidth * 0.4),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
