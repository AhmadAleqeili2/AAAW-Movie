

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final double width;
  final double height;
  final Color fillColor;
  final double fontSize;
  final TextAlign textAlign;
  final Color bordercolor;
  final Color hintTextColor; // معلمة جديدة لتخصيص لون نص الـ hintText

  const CustomTextField({
    super.key,
    this.hintText = '',
    this.obscureText = false,
    this.width = double.infinity,
    this.height = 50.0,
    this.fillColor = Colors.white,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.start,
    this.bordercolor = const Color(0xffC3C3C3),
    this.hintTextColor = const Color(0XFFFFFFFF), // القيمة الافتراضية للون النص
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        obscureText: obscureText,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextColor), // تخصيص لون النص هنا
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: bordercolor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: bordercolor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
