import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';

class pastSeache extends StatelessWidget {
  const pastSeache({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // وضع وظيفتك هنا
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primarycolor, // لون النص
          ),
          child: Row(
            spacing: 7,
            children: [
              Icon(
                Icons.search,
                size: screenHeight * 0.03,
                color: Colors.white,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: screenWidth * 0.63,
                child: Text(title),
              ),
            ],
          ),
        ),
        IconButton(
          alignment: Alignment.bottomLeft,
          icon: Image.asset(
            "assets/image/arrow_icon_leftUp.png",
            height: screenHeight * 0.02,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
