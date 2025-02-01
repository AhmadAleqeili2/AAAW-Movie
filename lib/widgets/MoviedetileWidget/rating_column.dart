
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';

class RatingColumn extends StatelessWidget {
  final String star;

  RatingColumn({required this.star});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_border_outlined,
          size: 35,
          color: Color(paleGray),
        ),
        Text(
          star,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}