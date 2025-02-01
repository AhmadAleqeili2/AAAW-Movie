import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:just_movie/constant/colors.dart';

// [PasswordTextField] Widget for password input field
class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final double screenWidth;

  PasswordTextField({required this.controller, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: const Color(darkGrey),
      hintText: ConstantNames.password.tr(),
      width: screenWidth * 0.85,
      isPass: true,
      obscureText: true,
      controller: controller,
    );
  }
}
