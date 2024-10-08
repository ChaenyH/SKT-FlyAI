import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../homeScreen/photo_preview_and_upload_screen.dart';

class CameraPreviewWidget extends StatefulWidget {
  final CameraController controller;
  final Future<void> initializeControllerFuture;

  CameraPreviewWidget({
    required this.controller,
    required this.initializeControllerFuture,
  });

  @override
  _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return FutureBuilder<void>(
      future: widget.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              // 카메라 미리보기
              CameraPreview(widget.controller),

              // 가이드라인 이미지
              Positioned(
                top: contextHeight * 2,
                left: contextWidth * 0.7,
                right: contextWidth * 0.7,
                child: Image.asset(
                  'assets/images/guideline1.png',
                  fit: BoxFit.contain,
                ),
              ),

              // 안내 문구
              Positioned(
                top: contextHeight * 1.2,
                left: contextWidth * 1.7,
                right: contextWidth * 1.7,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2,),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    '라인 안쪽으로 똥을 맞춰주세요',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contextWidth * 0.4,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



class CameraControlsWidget extends StatelessWidget {
  final CameraController controller;
  final Future<void> initializeControllerFuture;
  final Function onSwitchCamera;
  final Function onOpenGallery;

  CameraControlsWidget({
    required this.controller,
    required this.initializeControllerFuture,
    required this.onSwitchCamera,
    required this.onOpenGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.photo, color: Colors.white, size: 30),
            onPressed: () => onOpenGallery(),
          ),
          FloatingActionButton(
            onPressed: () async {
              try {
                await initializeControllerFuture;
                final image = await controller.takePicture();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoPreviewAndUploadScreen(imagePath: image.path),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: Icon(Icons.circle_outlined, size: 40),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.cameraswitch, color: Colors.white, size: 30),
            onPressed: () => onSwitchCamera(),
          ),
        ],
      ),
    );
  }
}
