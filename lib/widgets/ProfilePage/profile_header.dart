import 'package:flutter/material.dart';
import 'package:just_movie/services/navigate.dart';
import 'package:just_movie/view/setting_page.dart';

/// [ProfileHeader]
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.14159), // Flip horizontally
          child: Image.asset(
            'assets/image/Logo.png',
            width: 50,
            height: 50,
          ),
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white, size: 28),
          onPressed: () {
            navigateTo(context, SettingPage());
          },
        ),
      ],
    );
  }
}
