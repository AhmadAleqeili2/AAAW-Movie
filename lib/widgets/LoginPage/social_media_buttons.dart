import 'package:flutter/material.dart';
import 'package:just_movie/widgets/LoginPage/apple_Sign_in.dart';
import 'package:just_movie/widgets/LoginPage/facebook_Sign_in.dart';
import 'package:just_movie/widgets/LoginPage/google_Sign_in.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        facebookLogIn(context,screenWidth),
        const SizedBox(height: 10),
        GoogleSignin(context,screenWidth),
        const SizedBox(height: 10),
        AppleSignin(context,screenWidth),
      ],
    );
  }
}
