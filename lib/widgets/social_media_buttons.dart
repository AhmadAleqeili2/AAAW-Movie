import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/model/user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
           UserController().facebookSignIn(context);
          },
          icon: const Icon(Icons.facebook, color: Colors.white),
          label: Text(ConstantNames.facebookSignInText.tr(),
              style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF1877F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () async {
          UserController().googleSignIn(context);
          },
          icon: Image.asset("assets/image/GoogleLogo.png", height: 20),
          label: Text(ConstantNames.googleSignInText.tr()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () async {
          UserController().appleSignIn();
          },
          icon: const Icon(Icons.apple, color: Colors.white),
          label: Text(
            ConstantNames.appleSignInText.tr(),
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
      ],
    );
  }
}
