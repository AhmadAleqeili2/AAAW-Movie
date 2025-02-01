
import 'package:flutter/material.dart';
import 'package:just_movie/controller/setting_controller.dart';

/// [LanguageSelector] Widget for selecting the language
class LanguageSelector extends StatelessWidget {
  final SettingController controller;
  final double secreenWidth;

  LanguageSelector({required this.controller, required this.secreenWidth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.showLanguageMenu(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/image/Language_logo.png",
              height: secreenWidth * 0.05,
            ),
            SizedBox(width: secreenWidth * 0.03),
            Text(
              controller.selectedLanguage,
              style: TextStyle(
                color: Colors.white,
                fontSize: secreenWidth * 0.06,
              ),
            ),
            SizedBox(width: secreenWidth * 0.45),
            Icon(Icons.arrow_drop_down_outlined,
                color: Colors.white, size: secreenWidth * 0.1),
          ],
        ),
      ),
    );
  }
}