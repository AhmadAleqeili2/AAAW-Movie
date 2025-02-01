
import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:just_movie/widgets/SignUp/gender_options.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:easy_localization/easy_localization.dart';

/// [AgeGenderFields] Widget for age and gender fields
class AgeGenderFields extends StatelessWidget {
  final TextEditingController ageController;
  final TextEditingController genderController;
  final double screenWidth;

  AgeGenderFields({
    required this.ageController,
    required this.genderController,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextField(
          hintText: ConstantNames.age.tr(),
          width: screenWidth * 0.4,
          height: 50,
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          keyboard: TextInputType.numberWithOptions(),
          controller: ageController,
        ),
        GenderDropdown(
          controller: genderController,
        ),
      ],
    );
  }
}