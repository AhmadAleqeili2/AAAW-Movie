import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/media_data.dart';
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
                  splashColor: Colors.blue,
                  highlightColor: Colors.blue,
                  child: Container(
                    height: screenHeight * 0.40,
                    width: screenWidth,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:CachedNetworkImageProvider( mediaData[_currentIndex]['image']),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90),
                            ),
                          ),
                        ),
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            const Color.fromARGB(40, 0, 0, 0),
                            BlendMode.darken,
                          ),
                          child: Image.asset(
                            "assets/image/Shadow.png",
                            fit: BoxFit.cover,
                            height: screenHeight * 0.40,
                            width: screenWidth,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(50, 0, 0, 0),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  bottomRight: Radius.circular(90),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButtonButtom =
                                          index; // تغيير حالة الزر
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    width: 60,
                                    height: 4,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: selectedButtonButtom == index
                                          ? const Color.fromARGB(140, 255, 255,
                                              255) // أقل شفافية عند التحديد
                                          : const Color.fromARGB(50, 255, 255,
                                              255), // أبيض شفاف عند عدم التحديد
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        // الشريط العلوي القابل للتمرير
                        Positioned(
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
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(
                                        3.14159), // قلب الصورة أفقيًا
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
                                          "All", selectedButtonTop == 0, 0),
                                      _buildOption(
                                          "Movies", selectedButtonTop == 1, 1),
                                      _buildOption(
                                          "Tv Show", selectedButtonTop == 2, 2),
                                      _buildOption(
                                          "Series", selectedButtonTop == 3, 3),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ScrolledListWidget(mediaData, "Recommended to you"),
                ScrolledListWidget(mediaDataReversed, "The Most Viewed"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String text, bool isSelected, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          width: 70,
          child: TextButton(
            onPressed: () {
              setState(() {
                print(selectedButtonTop);
                // تغيير حالة الزر عند الضغط
                selectedButtonTop = index;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: isSelected ? Colors.white : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            ),
          )),
    );
  }

}
