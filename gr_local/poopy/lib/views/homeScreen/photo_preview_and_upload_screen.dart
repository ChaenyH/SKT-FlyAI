import 'package:flutter/material.dart';
import '../../controllers/navigation_controller.dart';
import '../cameraScreen/components/photo_preview_widgets.dart';



class PhotoPreviewAndUploadScreen extends StatelessWidget {
  final String imagePath;
  final NavigationController _navController = NavigationController();

  PhotoPreviewAndUploadScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
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
              // Navigator.pop(context);
              // _navController.navigateToCalendar(context);
            },
          ),
          SizedBox(height: contextHeight * 0.5),
        ],
      ),
    );
  }
}
