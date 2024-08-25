import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/photo_preview_widgets.dart';

class PhotoPreviewAndUploadScreen extends StatelessWidget {
  final String imagePath;

  PhotoPreviewAndUploadScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PhotoPreviewAppBar(),
      body: Column(
        children: [
          PhotoPreviewImage(imagePath: imagePath,),
          SizedBox(height: contextHeight * 0.3),
          UploadButton(
            onPressed: () {
              // 업로드 로직을 추가하세요.
              Navigator.pushReplacementNamed(context, '/calendar');
            },
          ),
          SizedBox(height: contextHeight * 0.5),
        ],
      ),
    );
  }
}
