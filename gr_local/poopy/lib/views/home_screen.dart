// import 'package:flutter/material.dart';
// import 'package:poopy/views/widgets/home_action_button_widget.dart';
// import 'package:poopy/views/widgets/card_news_widget.dart';
// import 'package:poopy/views/widgets/dog_profile_widget.dart';
// import 'package:poopy/views/widgets/expandable_fab.dart';
// import 'package:poopy/views/widgets/status_card_widget.dart';
//
// import '../controllers/navigation_controller.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HomeScreen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DogProfileWidget(),  // 프로필 위젯
//             SizedBox(height: 20),
//             StatusCardWidget(),
//             SizedBox(height: 10),
//             HomeCameraButtonWidget(),
//             SizedBox(height: 20),
//             CardNewsWidget(),
//           ],
//         ),
//       ),
//       floatingActionButton: GlobalExpandableFab(), // 여기에 ExpandableFab 적용
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/home_action_button_widget.dart';
import 'package:poopy/views/widgets/card_news_widget.dart';
import 'package:poopy/views/widgets/dog_profile_widget.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';
import 'package:poopy/views/widgets/status_card_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Column(
        children: [
          // 고정된 프로필 위젯
          Padding(
            padding: EdgeInsets.only(
              top: contextHeight * 0.6,
              bottom: contextHeight * 0.2,
              left: contextWidth * 0.5,
            ),
            child: DogProfileWidget(),
          ),
          // 스크롤 가능한 영역
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: contextWidth * 0.5
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusCardWidget(),
                    SizedBox(height: 10),
                    HomeCameraButtonWidget(),
                    SizedBox(height: 20),
                    CardNewsWidget(),
                    SizedBox(height: 300),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GlobalExpandableFab(), // FAB 버튼
    );
  }
}
