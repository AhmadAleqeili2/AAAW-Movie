import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:easy_localization/easy_localization.dart';

/// [NameFields] Widget for first name and last name fields
class NameFields extends StatelessWidget {
  final TextEditingController firstNAmeController;
  final TextEditingController lassNameController;
  final double screenWidth;

  NameFields({
    required this.firstNAmeController,
    required this.lassNameController,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextField(
          hintText: ConstantNames.firstName.tr(),
          width: screenWidth * 0.4,
          height: 50,
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          controller: firstNAmeController,
        ),
        CustomTextField(
          hintText: ConstantNames.lastName.tr(),
          width: screenWidth * 0.4,
          height: 50,
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          controller: lassNameController,
        ),
      ],
    );
  }
}
