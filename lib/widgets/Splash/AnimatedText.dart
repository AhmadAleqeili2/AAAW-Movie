import 'package:flutter/material.dart';

/// [AnimatedText] Widget for displaying animated text
class AnimatedText extends StatelessWidget {
  final double fontSize;
  final double textOpacity;
  final double animationValue;

  const AnimatedText({
    required this.fontSize,
    required this.textOpacity,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: _height / fontSize,
        ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 2000),
          opacity: textOpacity,
          child: Text(
            'Movie Hub',
            style: TextStyle(
              color: const Color.fromARGB(255, 250, 22, 6),
              fontWeight: FontWeight.bold,
              fontSize: animationValue,
            ),
          ),
        ),
      ],
    );
  }
}
