import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget ordevider() {
  Color a = Color(0xFF1877F2).withValues(
  red: 0.5, 
  green: 0.5, 
  blue: 0.5, 
);
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: a,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'OR'.tr(),
          style: TextStyle(color: a),
        ),
      ),
      Expanded(
        child: Divider(
          color: a,
        ),
      ),
    ],
  );
}
