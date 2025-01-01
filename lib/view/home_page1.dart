import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/view/movie_list.dart';
import 'package:just_movie/widgets/main_image.dart';
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
      setState(() {
        _currentIndex = (_currentIndex + 1) % mediaData.length;
        _startAutoSlide();
      });
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
    // final List<Map<String, String>> items = [
    //   {"image": "assets/image/movie_logo.png", "title": "Alp Arslan"},
    //   {"image": "assets/image/movie_logo.png", "title": "Payitaht"},
    //   {"image": "assets/image/movie_logo.png", "title": "Kudüs Fatihi"},
    //   {"image": "assets/image/movie_logo.png", "title": "Selahaddin"},
    // ];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    _startAutoSlide();

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
                  onTap: () {/*اذا بدك الصورة الرئيسية تعمل اشي لما تضغطها*/},
                  splashColor: Colors.blue,
                  highlightColor: Colors.blue,
                  child: Container(
                    height: screenHeight * 0.40,
                    width: screenWidth,
                    child: imageandbutton(
                      currentIndex: _currentIndex, // للصور
                      selectedButtonTop: selectedButtonTop,
                      UperrButton: [
                        () {},
                        () {},
                        () {},
                        () {}
                      ], //تعديل الازرار الي فوق الصورة
                    ), //ملاحظه الازرار الي تحت الصورة اكتبهم بالكلاسس نفسه
                  ),
                ),
                ScrolledListWidget(
                  items: MovieController.media,
                  title: "Recommended to you",
                  arrowPage: MovieListView(
                    mediaData: MovieController.media,
                  ),
                  WithArrow: true,
                ), //قائمة الجانبية
                ScrolledListWidget(
                  items: MovieController.media.reversed.toList(),
                  title: "The Most Viewed",
                  arrowPage:MovieListView(
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
