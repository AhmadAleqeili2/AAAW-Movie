import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:just_movie/constant/colors.dart';

// [EmailTextField] Widget for email input field
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final double screenWidth;

  EmailTextField({required this.controller, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: Color(darkGrey),
      hintText: ConstantNames.email.tr(),
      width: screenWidth * 0.85,
      controller: controller,
    );
  }
}
