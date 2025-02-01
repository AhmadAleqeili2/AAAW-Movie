
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/view/forget_password.dart';
import 'package:just_movie/widgets/LoginPage/custom_text_button.dart';
import 'package:just_movie/view/slide_transition.dart';

// [ForgotPasswordButton] Widget for forgot password button
class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonText: ConstantNames.forgetYourPassword.tr(),
      onPressed: () {
        Navigator.push(context, ScaleTransition1(ForgotPassword()));
      },
    );
  }
}