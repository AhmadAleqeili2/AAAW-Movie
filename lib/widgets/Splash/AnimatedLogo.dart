
import 'package:flutter/material.dart';

/// [AnimatedLogo] Widget for displaying animated logo
class AnimatedLogo extends StatelessWidget {
  final double containerOpacity;
  final double width;

  const AnimatedLogo({
    required this.containerOpacity,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 2000),
      curve: Curves.fastLinearToSlowEaseIn,
      opacity: containerOpacity,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: width,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset('assets/image/Logo.png'),
      ),
    );
  }
}