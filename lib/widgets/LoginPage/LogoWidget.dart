import 'package:flutter/material.dart';

// [LogoWidget] Widget for displaying the logo
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/Logo.png',
      height: 200,
    );
  }
}
