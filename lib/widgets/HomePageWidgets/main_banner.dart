
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/view/home_page1.dart';
import 'package:just_movie/widgets/HomePageWidgets/main_image.dart';

/// [MainBanner]
/// Displays the sliding image banner and category selection buttons.
class MainBanner extends StatelessWidget {
  final int currentIndex;
  final Function(int, String) onCategorySelected;

  const MainBanner({
    required this.currentIndex,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: screenHeight * 0.40,
        width: screenWidth,
        child: imageandbutton(
          currentIndex: currentIndex,
          selectedButtonTop: selectedButtonTop,
          UperrButton: List.generate(4, (index) => () {
            onCategorySelected(
              index,
              [
                ConstantNames.all.tr(),
                ConstantNames.film.tr(),
                ConstantNames.tvShow.tr(),
                ConstantNames.series.tr(),
              ][index],
            );
          }),
        ),
      ),
    );
  }
}
