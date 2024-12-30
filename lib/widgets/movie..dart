import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoviewWidget extends StatelessWidget {
  const MoviewWidget({super.key, required this.url, required this.data,required this.index});
  final String url;
  final String data;
  final int columnCount = 2;
final int index;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
        position: index,
        duration: Duration(milliseconds: 500),
        columnCount: columnCount,
        child: ScaleAnimation(
            duration: Duration(milliseconds: 900),
            curve: Curves.fastLinearToSlowEaseIn,
            child: FadeInAnimation(
                child: SafeArea(
              child: Column(
                spacing: 8,
                children: [
                  CachedNetworkImage(
                    imageUrl: url,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: SizedBox(
                        height: 20,
                        child: Text(
                          data,
                          style: TextStyle(fontSize: 13),
                        )),
                  )
                ],
              ),
            ))));
  }
}
