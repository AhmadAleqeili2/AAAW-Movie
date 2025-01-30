import 'package:flutter/material.dart';

class BuildOption extends StatelessWidget {
  const BuildOption(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.onPressed,
      required this.height,
      required this.isSelectedColor,
      required this.notSelectedColor,
      required this.width,
      required this.text});
  final String text;
  final VoidCallback onPressed;
  final int index;
  final bool isSelected;
  final double width;
  final double height;
  final Color isSelectedColor;
  final Color notSelectedColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: width,
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: isSelected ? isSelectedColor : notSelectedColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            text,
            softWrap: false,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}