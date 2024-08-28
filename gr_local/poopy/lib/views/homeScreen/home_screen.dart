import 'package:flutter/material.dart';
import 'package:poopy/views/rive_background.dart';
import 'package:poopy/views/homeScreen/components/dog_profile_widget.dart';
import 'package:poopy/views/expandable_fab.dart';
import 'package:poopy/views/homeScreen/components/home_widgets_1.dart';
import 'components/home_widgets_2.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: Stack(
        children: [
          const StalledBackground3(),
          Column(
            children: [
              // 상단에 고정된 DogProfileWidget
              Padding(
                padding: EdgeInsets.only(
                  top: contextHeight * 0.6,
                  bottom: contextHeight * 0.15,
                  left: contextWidth * 0.5,
                ),
                child: DogProfileWidget(),
              ),
              // 아래의 스크롤 가능한 PageView
              Expanded(
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  children: [
                    // 페이지 1
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: contextWidth * 0.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: contextHeight * 0.1),
                          StatusCardWidget(),
                          SizedBox(height: contextHeight * 0.1),
                          HomeCameraButtonWidget(),
                          SizedBox(height: contextHeight * 0.3),
                          CardNewsWidget(),
                        ],
                      ),
                    ),
                    // 페이지 2
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: contextWidth * 0.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: contextHeight * 0.2),
                          BadgesWidget(),
                          SizedBox(height: contextHeight * 0.3),
                          ChatLogWidget(),
                          SizedBox(height: contextHeight * 0.3),
                          MiniGalleryWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: GlobalExpandableFab(), // FAB 버튼
    );
  }
}
