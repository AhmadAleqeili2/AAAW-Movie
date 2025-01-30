import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';

Widget GoogleSignin (BuildContext context,double screenWidth){
  return         ElevatedButton.icon(
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
        );
}