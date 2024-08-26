import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image, LinearGradient;

class RiveBackground extends StatelessWidget {
  final double blurSigmaX;
  final double blurSigmaY;

  const RiveBackground({
    super.key,
    this.blurSigmaX = 50.0,
    this.blurSigmaY = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6B33EF),
            Color(0xFF620DBF),
            Color(0xFF7561E4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            bottom: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset("assets/rive/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/rive/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
              child: const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
