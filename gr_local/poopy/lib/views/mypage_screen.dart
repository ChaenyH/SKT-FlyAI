import 'package:flutter/material.dart';
import 'package:poopy/views/widgets/expandable_fab.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: Text('My Page Screen'),
      ),
      floatingActionButton: GlobalExpandableFab(),
    );
  }
}
