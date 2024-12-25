
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textColor = const Color(0XFFFFFFFF), // اللون الافتراضي للنص
    this.fontSize = 14, // الحجم الافتراضي للنص
    this.fontWeight = FontWeight.normal, // الوزن الافتراضي للنص
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child:  TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor, // تعيين اللون للنص
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: fontSize, // حجم الخط
          fontWeight: fontWeight, // وزن الخط
        ),
      ),
    ));
  }
}
