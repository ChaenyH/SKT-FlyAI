import 'dart:io';
import 'package:flutter/material.dart';

class PhotoPreviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

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

class UploadButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UploadButton({required this.onPressed,});

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
          onPressed: onPressed,
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
