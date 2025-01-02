import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/view/movie_list.dart';
import 'package:just_movie/widgets/HomePageWidgets/main_image.dart';
import 'package:just_movie/widgets/scrolled_list_widget.dart';

class HomePageBody extends StatefulWidget {
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedButtonButtom = 0; // متابعة حالة الزر النشط
  int selectedButtonTop = 0;
  int _currentIndex = 0;
  Timer? _timer;

  void _startAutoSlide() {
  _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    if (mounted) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % mediaData.length;
      });
    } else {
      timer.cancel();
    }
  });
}

@override
initState() {
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
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.40,
                  width: screenWidth,
                  child: imageandbutton(
                    currentIndex: _currentIndex,
                    selectedButtonTop: selectedButtonTop,
                    UperrButton: [
                      () {},
                      () {},
                      () {},
                      () {}
                    ],
                  ),
                ),
              ),
              ScrolledListWidget(
                items: MovieController.media,
                title: "Recommended to you".tr(),
                arrowPage: MovieListView(
                  mediaData: MovieController.media,
                ),
                WithArrow: true,
              ),
              ScrolledListWidget(
                items: MovieController.media.reversed.toList(),
                title: "The Most Viewed".tr(),
                arrowPage: MovieListView(
                  mediaData: MovieController.media.reversed.toList(),
                ),
                WithArrow: true,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

  }

