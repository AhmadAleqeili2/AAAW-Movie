import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';

Widget AppleSignin(BuildContext context,double screenWidth){
  return         ElevatedButton.icon(
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
        );
}