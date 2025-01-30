import 'package:flutter/material.dart';
import 'package:just_movie/services/navigate.dart';

Widget moreButton(context, Page) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
            color: Color(0xFF252525),
            borderRadius: BorderRadius.all(Radius.circular(50))),
      ),
      Positioned(
          bottom: -4,
          child: TextButton(
              onPressed: () {
                navigateTo(context, Page);
              },
              child: Text(
                ".....",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )))
    ],
  );
}
