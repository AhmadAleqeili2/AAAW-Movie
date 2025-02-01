import 'package:flutter/material.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/widgets/LoginPage/LogoWidget.dart';
import 'package:just_movie/widgets/LoginPage/EmailTextField.dart';
import 'package:just_movie/widgets/LoginPage/PasswordTextField.dart';
import 'package:just_movie/widgets/LoginPage/ForgotPasswordButton.dart';
import 'package:just_movie/widgets/LoginPage/LoginSignUpButtons.dart';
import 'package:just_movie/widgets/LoginPage/PrivacyTermsText.dart';
import 'package:just_movie/widgets/LoginPage/or_devider.dart';
import 'package:just_movie/widgets/LoginPage/social_media_buttons.dart';

///[LoginPage] The main login page widget
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    UserController auth = UserController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              //  Logo widget
              LogoWidget(),
              //  Email input field
              EmailTextField(controller: emailController, screenWidth: screenWidth),
              //  Password input field
              PasswordTextField(controller: passController, screenWidth: screenWidth),
              //  Forgot password button
              ForgotPasswordButton(),
              //  Login and Sign Up buttons
              LoginSignUpButtons(auth: auth, emailController: emailController, passController: passController, screenWidth: screenWidth),
              //  Divider with "or"
              ordevider(),
              //  Social media login buttons
              const SocialMediaButtons(),
              //  Privacy and terms text
              PrivacyTermsText(),
            ],
          ),
        ),
      ),
    );
  }
}
