import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/home_action_button_widget.dart';
import 'package:poopy/views/widgets/card_news_widget.dart';
import 'package:poopy/views/widgets/dog_profile_widget.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';
import 'package:poopy/views/widgets/status_card_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DogProfileWidget(),  // 프로필 위젯
            SizedBox(height: 20),
            StatusCardWidget(title: 'Today my dog\'s status'),
            SizedBox(height: 10),
            HomeActionButtonWidget(
              title: 'Take Photo',
              icon: Icons.camera_alt,
              onTap: () {
                Navigator.pushNamed(context, '/camera');
              },
            ),
            SizedBox(height: 20),
            CardNewsWidget(),
          ],
        ),
      ),
      floatingActionButton: GlobalExpandableFab(), // 여기에 ExpandableFab 적용
    );
  }
}
