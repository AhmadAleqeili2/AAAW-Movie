
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/view/home_page1.dart';
import 'package:just_movie/widgets/HomePageWidgets/main_banner.dart';
import 'package:just_movie/widgets/HomePageWidgets/movie_section.dart';

/// [HomePageContent]
/// Displays the main content of the homepage, including the banner and movie lists.
class HomePageContent extends StatelessWidget {
  final int currentIndex;
  final Function(int, String) onCategorySelected;

  const HomePageContent({
    required this.currentIndex,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Media> fetchData = MovieController.media
        .where((media) => WatsSelected == ConstantNames.all.tr() || media.type == WatsSelected)
        .toList();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          color: primarycolor,
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //  Displays the main sliding image with category selection.
                MainBanner(
                  currentIndex: currentIndex,
                  onCategorySelected: onCategorySelected,
                ),
                
                //  Displays the first section of movies.
                MovieSection(
                  title: ConstantNames.goodToSeeYou.tr(),
                  mediaList: fetchData,
                ),
                
                // Displays the most viewed movies section.
                MovieSection(
                  title: ConstantNames.mostViewed.tr(),
                  mediaList: fetchData.reversed.toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

