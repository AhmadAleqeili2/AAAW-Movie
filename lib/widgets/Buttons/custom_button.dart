import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String buttonText;
  final double width;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback? onTap; // جعل معلمة onTap اختيارية

  const CustomButton({
    super.key,
    this.backgroundColor = const Color(0XFFCC2A1B),
    this.buttonText = 'Custom Button',
    this.width = double.infinity,
    this.height = 50.0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2.0,
    this.onTap, // جعل onTap اختيارية
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap ?? () {}, // إذا لم يتم تمرير onTap، سيتم تنفيذ دالة فارغة
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}
