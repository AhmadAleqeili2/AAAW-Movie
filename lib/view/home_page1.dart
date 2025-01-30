import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/view/movie_list.dart';
import 'package:just_movie/widgets/HomePageWidgets/main_image.dart';
import 'package:just_movie/widgets/Core/scrolled_list_widget.dart';

List<Media> Alldata = MovieController.media;
String WatsSelected = ConstantNames.all.tr();
int selectedButtonButtom = 0; // متابعة حالة الزر النشط
int selectedButtonTop = 0;

class HomePageBody extends StatefulWidget {
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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
    List<Media> getDataWhere(String type, List<Media> AllData) {
      if (type != ConstantNames.all.tr()) {
        List<Media> media = [];
        for (int i = 0; i < AllData.length; i++) {
          if (AllData[i].type == type) {
            media.add(AllData[i]);
          }
        }
        return media;
      } else {
        return Alldata;
      }
    }

    List<Media> fetchdata = getDataWhere(WatsSelected, Alldata);
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
                      UperrButton: List.generate(
                        4, // عدد الأنواع 4 فقط
                        (index) => () {
                          setState(() {
                            selectedButtonTop = index;
                            WatsSelected = [
                              ConstantNames.all.tr(),
                              ConstantNames.film.tr(),
                              ConstantNames.tvShow.tr(),
                              ConstantNames.series.tr(),
                            ][index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                ScrolledListWidget(
                  items: fetchdata,
                  title: ConstantNames.goodToSeeYou.tr(),
                  arrowPage: MovieListView(
                    mediaData: fetchdata,
                  ),
                  WithArrow: true,
                ),
                ScrolledListWidget(
                  items: fetchdata.reversed.toList(),
                  title: ConstantNames.mostViewed.tr(),
                  arrowPage: MovieListView(
                    mediaData: fetchdata.reversed.toList(),
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
