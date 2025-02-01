
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/widgets/Core/custom_button.dart';
import 'package:just_movie/view/signup_page.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/view/slide_transition.dart';

// [LoginSignUpButtons] Widget for login and sign up buttons
class LoginSignUpButtons extends StatelessWidget {
  final UserController auth;
  final TextEditingController emailController;
  final TextEditingController passController;
  final double screenWidth;

  LoginSignUpButtons({required this.auth, required this.emailController, required this.passController, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          buttonText: ConstantNames.login.tr(),
          width: screenWidth * 0.4,
          height: 54,
          onTap: () async {
            await auth.login(emailController.value.text, passController.value.text, context);
          },
        ),
        CustomButton(
          buttonText: ConstantNames.signUp.tr(),
          width: screenWidth * 0.4,
          height: 54,
          backgroundColor: const Color(black),
          borderColor: const Color(rustRed),
          onTap: () {
            Navigator.push(context, ScaleTransition1(SignUpPage()));
          },
        ),
      ],
    );
  }
}