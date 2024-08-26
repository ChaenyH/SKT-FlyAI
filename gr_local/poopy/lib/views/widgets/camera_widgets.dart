import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../photo_preview_and_upload_screen.dart';

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
    return FutureBuilder<void>(
      future: widget.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(widget.controller);
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
