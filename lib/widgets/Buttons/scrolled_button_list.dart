import 'package:flutter/material.dart';

class ScrolledButtonList extends StatefulWidget {
  final bool withlogo;
  final Color isSelectedColor;
  final Color notSelectedColor;
  final double width;
  final double height;
  final List<String> Bnames;
  final List<VoidCallback> BPress;
  final int selectedButtonButtom;
  final int selectedButtonTop;

   ScrolledButtonList({
    Key? key,
    this.withlogo = false,
    this.isSelectedColor = Colors.white,
    this.notSelectedColor = Colors.transparent,
    this.width = 70,
    this.height = 33,
    this.Bnames = const ["All", "Movies", "Tv Show", "Series"],
    required this.BPress,
    this.selectedButtonButtom = 0,
    this.selectedButtonTop = 0,
  }) : super(key: key);

  @override
  State<ScrolledButtonList> createState() => _ScrolledButtonListState();
}

class _ScrolledButtonListState extends State<ScrolledButtonList> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40, // لضبط المسافة من الأعلى
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // التمرير أفقي
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // شعار
              if (widget.withlogo)
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14159), // قلب الصورة أفقيًا
                  child: Image.asset(
                    'assets/image/Logo.png', // استبدل بمسار الشعار الخاص بك
                    width: 50,
                    height: 50,
                  ),
                ),
              // خيارات
              Row(
                children: [
                  _buildOption(
                    widget.Bnames[0],
                    widget.selectedButtonTop == 0,
                    0,
                    widget.BPress[0],
                  ),
                  _buildOption(
                    widget.Bnames[1],
                    widget.selectedButtonTop == 1,
                    1,
                    widget.BPress[1],
                  ),
                  _buildOption(
                    widget.Bnames[2],
                    widget.selectedButtonTop == 2,
                    2,
                    widget.BPress[2],
                  ),
                  _buildOption(
                    widget.Bnames[3],
                    widget.selectedButtonTop == 3,
                    3,
                    widget.BPress[3],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text, bool isSelected, int index, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: isSelected
                ? widget.isSelectedColor
                : widget.notSelectedColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            text,
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
