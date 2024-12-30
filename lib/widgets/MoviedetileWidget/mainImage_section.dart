import 'package:flutter/material.dart';
import 'package:just_movie/widgets/main_imag_widget.dart';
final List<Map<String, String>> items = [
  {
    "image": "assets/image/movie_logo.png",
    "title": "Alp Arslan",
    "day": "thursday",
    "season": "5",
    "star": "4.7/5",
    "desc":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
  },
  {"image": "assets/image/movie_logo.png", "title": "Payitaht"},
  {"image": "assets/image/movie_logo.png", "title": "Kudüs Fatihi"},
  {"image": "assets/image/movie_logo.png", "title": "Selahaddin"},
];
class MainImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.40,
      width: screenWidth,
      child: Stack(
        children: [
          MainImagWidget(items: items),
          Positioned(
            top: 90,
            left: 90,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                size: 200,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
