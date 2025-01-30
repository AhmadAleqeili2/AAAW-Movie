import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoviewWidget extends StatelessWidget {
  const MoviewWidget(
      {super.key, required this.url, required this.data, required this.index});
  final String url;
  final String data;
  final int columnCount = 2;
  final int index;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * .30,
      width: screenWidth * .30,
      decoration: BoxDecoration(
          boxShadow: List.filled(
              1, BoxShadow(color: const Color.fromARGB(99, 63, 51, 51), spreadRadius: 2, // How wide the shadow is spread
                  blurRadius: 7, 
                  offset: Offset(0, 3),)),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(117, 252, 24, 8),
            width: 1,
          )),
      child: AnimationConfiguration.staggeredGrid(
          position: index,
          duration: Duration(milliseconds: 1000),
          columnCount: columnCount,
          child: ScaleAnimation(
              duration: Duration(milliseconds: 1900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                  child: SafeArea(
                child: Column(
                  spacing: 20,
                  children: [
                    CachedNetworkImage(
                      imageUrl: url,
                      height: screenWidth * .2,
                      width: screenWidth * .40,
                      fit: BoxFit.fitWidth,
                    ),
                    Center(
                      child: SizedBox(
                          height: screenHeight * .07,
                          child: Text(
                            data,
                            style: TextStyle(fontSize: 13),
                          )),
                    )
                  ],
                ),
              )))),
    );
  }
}
