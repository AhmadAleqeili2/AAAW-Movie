import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/widgets/HomePageWidgets/home_page_content.dart';


List<Media> Alldata = MovieController.media;
String WatsSelected = ConstantNames.all.tr();
int selectedButtonTop = 0;

/// [HomePageBody]
/// Main home page layout containing the sliding image and movie lists.
class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _currentIndex = 0;
  Timer? _timer;

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % Alldata.length;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageContent(
      currentIndex: _currentIndex,
      onCategorySelected: (int index, String category) {
        setState(() {
          selectedButtonTop = index;
          WatsSelected = category;
        });
      },
    );
  }
}
