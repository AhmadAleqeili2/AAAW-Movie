
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';

class CalendarColumn extends StatelessWidget {
  final String day;

  CalendarColumn({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 35,
          color: Color(paleGray),
        ),
        Text(
          day,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
