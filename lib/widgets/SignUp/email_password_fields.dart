import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:easy_localization/easy_localization.dart';

/// [EmailPasswordFields] Widget for email and password fields
class EmailPasswordFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController conPassController;
  final double screenWidth;

  EmailPasswordFields({
    required this.emailController,
    required this.passController,
    required this.conPassController,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: ConstantNames.email.tr(),
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          width: screenWidth * 0.85,
          keyboard: TextInputType.emailAddress,
          controller: emailController,
        ),
        CustomTextField(
          hintText: ConstantNames.password.tr(),
          obscureText: true,
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          isPass: true,
          width: screenWidth * 0.85,
          controller: passController,
        ),
        CustomTextField(
          hintText: ConstantNames.confirmPassword.tr(),
          obscureText: true,
          fillColor: const Color(darkGrey),
          hintTextColor: const Color(white),
          isPass: true,
          width: screenWidth * 0.85,
          controller: conPassController,
        ),
      ],
    );
  }
}
