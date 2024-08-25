import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/photo_preview_widget.dart';
import 'package:poopy/views/widgets/upload_button_widget.dart';

class PhotoPreviewAndUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Preview and Upload'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Retake', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhotoPreview(),
            SizedBox(height: 20),
            UploadButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
