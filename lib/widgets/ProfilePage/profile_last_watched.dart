
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';

/// [ProfileLastWatched]
class ProfileLastWatched extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstantNames.lastWatched.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Vikings Season 5 | Episode 7 | 00:25:23',
            style: TextStyle(
              color: Color(lightGreyShade),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}