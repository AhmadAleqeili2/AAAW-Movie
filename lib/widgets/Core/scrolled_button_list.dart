import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/widgets/Core/build_option.dart';

class ScrolledButtonList extends StatefulWidget {
  final bool withlogo;
  final Color isSelectedColor;
  final Color notSelectedColor;
  final double width;
  final double height;
  late List<String> Bnames;
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
    List<String>? Bnames, // Accepts null, will initialize in the constructor
    required this.BPress,
    this.selectedButtonButtom = 0,
    this.selectedButtonTop = 0,
  }) : super(key: key) {
    // Initialize Bnames here to avoid `tr()` issue
    this.Bnames = Bnames ??
        [
          ConstantNames.all.tr(),
          ConstantNames.title.tr(),
          ConstantNames.tvShow.tr(),
          ConstantNames.series.tr()
        ];
  }

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
                children: List.generate(
                  widget.BPress.length,
                  (index) => BuildOption(
                    text: widget.Bnames[index],
                    isSelected: widget.selectedButtonTop == index,
                    index: index,
                    onPressed: widget.BPress[index],
                    width: widget.width,
                    height: widget.height,
                    notSelectedColor: widget.notSelectedColor,
                    isSelectedColor: widget.isSelectedColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
