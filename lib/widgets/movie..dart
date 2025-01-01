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
    return SizedBox(
      height: 33300,
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
                  spacing: 8,
                  children: [
                    CachedNetworkImage(
                      imageUrl: url,
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SizedBox(
                          height: 17,
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
