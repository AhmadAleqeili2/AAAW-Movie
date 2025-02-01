import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
/// [SignInRedirect] Redirects user to sign-in page

class SignInRedirect extends StatelessWidget {
  final UserController controller;
  const SignInRedirect({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => controller.navigateToSignIn(context),
        child: RichText(
          text: TextSpan(
            text: ConstantNames.haveAccount.tr(),
            style: const TextStyle(color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: ConstantNames.signIn.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 17, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}