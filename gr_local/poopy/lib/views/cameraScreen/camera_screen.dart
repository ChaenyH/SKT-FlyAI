
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poopy/views/cameraScreen/components/camera_widgets.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> cameras;
  CameraDescription? selectedCamera;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    selectedCamera = cameras.first;
    _controller = CameraController(
      selectedCamera!,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  void switchCamera() {
    setState(() {
      selectedCamera = (selectedCamera == cameras.first)
          ? cameras.last
          : cameras.first;
      _controller = CameraController(
        selectedCamera!,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  Future<void> openGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Navigator.push();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CameraScreen'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // 이전 버튼 아이콘 색상을 흰색으로 설정
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: CameraPreviewWidget(
              controller: _controller,
              initializeControllerFuture: _initializeControllerFuture,
            ),
          ),
          CameraControlsWidget(
            controller: _controller,
            initializeControllerFuture: _initializeControllerFuture,
            onSwitchCamera: switchCamera,
            onOpenGallery: openGallery,
          ),
        ],
      ),
    );
  }
}