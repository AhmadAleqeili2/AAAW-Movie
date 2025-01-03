import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // تأكد من إضافة هذه المكتبة لاستخدام TapGestureRecognizer
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/view/forget_password.dart';
import 'package:just_movie/view/signup_page.dart';
import 'package:just_movie/widgets/Buttons/custom_text_button.dart';
import 'package:just_movie/widgets/Buttons/custom_button.dart';
import 'package:just_movie/widgets/custom_text_fields.dart';
import 'package:just_movie/widgets/or_devider.dart';
import 'package:just_movie/widgets/social_media_buttons.dart';

import 'slide_transition.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    UserController  auth = UserController ();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              const SizedBox(height: 80),
              // Logo
              Image.asset(
                'assets/image/Logo.png',
                height: 200,
              ),

              CustomTextField(
                fillColor: Color(0xff222222),
                hintText: 'E-mail'.tr(),
                width: screenWidth * 0.85,
                controller: emailController,
              ),
              CustomTextField(
                fillColor: const Color(0xff222222),
                hintText: 'Password'.tr(),
                width: screenWidth * 0.85,
                isPass: true,
                obscureText: true,
                controller: passController,
              ),
              CustomTextButton(
                buttonText: 'Forget Your password ?'.tr(),
                onPressed: () {
                      Navigator.push(context, ScaleTransition1(ForgotPassword()));
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      buttonText: "Login".tr(),
                      width: screenWidth * 0.4,
                      height: 54,
                      onTap: () async {
                        await auth.login(emailController.value.text,
                            passController.value.text, context);
                      }),
                  CustomButton(
                    buttonText: "Sign up".tr(),
                    width: screenWidth * 0.4,
                    height: 54,
                    backgroundColor: const Color(0XFF000000),
                    borderColor: const Color(0XFFCC2A1B),
                    onTap: () {
                      Navigator.push(context, ScaleTransition1(SignUpPage()));
                    },
                  ),
                ],
              ),
              ordevider(),
              // Social Media Buttons (Custom Widget)
              const SocialMediaButtons(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  // تأكد من توسيط النص
                  child: RichText(
                    textAlign: TextAlign.center, // توسيط النص داخل RichText
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white, fontSize: 10), // النص الافتراضي
                      children: <TextSpan>[
                         TextSpan(
                          text:
                              'Note: This account is governed by our '.tr(), // جزء من النص العادي
                        ),
                        TextSpan(
                          text: 'Privacy Policy'.tr(), // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // يمكنك إضافة هنا حدث عند الضغط على الزر
                            },
                        ),
                         TextSpan(
                          text: ' and '.tr(), // جزء من النص العادي
                        ),
                        TextSpan(
                          text:
                              'Terms & Conditions'.tr(), // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // يمكنك إضافة هنا حدث عند الضغط على الزر
                            },
                        ),
                         TextSpan(
                          text:
                              '. By using this app, you agree to comply with these policies.'.tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
