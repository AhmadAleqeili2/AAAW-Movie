
import 'package:flutter/material.dart';

class ScrolledButtonList extends StatelessWidget {
  final Color notSelectedColor;
  final Color isSelectedColor;
  final int selectedButtonTop;
  final double width;
  final List<String> Bnames;
  final List<VoidCallback> BPress;

  const ScrolledButtonList({
    Key? key,
    required this.notSelectedColor,
    required this.isSelectedColor,
    required this.selectedButtonTop,
    required this.width,
    required this.Bnames,
    required this.BPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ...existing code...
    );
  }
}