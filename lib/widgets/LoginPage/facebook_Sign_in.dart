import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/constant/names.dart';

Widget facebookLogIn(BuildContext context,double screenWidth) {
  return         ElevatedButton.icon(
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
        );
}