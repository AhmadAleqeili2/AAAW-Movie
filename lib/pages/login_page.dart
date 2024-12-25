import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // تأكد من إضافة هذه المكتبة لاستخدام TapGestureRecognizer
import 'package:just_movie/pages/signup_page.dart';
import 'package:just_movie/widgets/custom_text_button.dart';
import 'package:just_movie/widgets/custom_button.dart';
import 'package:just_movie/widgets/custom_text_fields.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/widgets/or_devider.dart';
import 'package:just_movie/widgets/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo
              Image.asset(
                'assets/image/Logo.png',
                height: 200,
              ),
              const SizedBox(height: 20),
           
              CustomTextField(fillColor: Color(0xff222222),hintText: 'E-mail',width: screenWidth *0.85,),
              SizedBox(height: 20,),
              CustomTextField(fillColor: const Color(0xff222222),hintText: 'Password',width: screenWidth *0.85,),
              CustomTextButton(buttonText: 'Forget Your password ?', onPressed: () {  },),
              const SizedBox(height: 20),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(buttonText: "Login",width: screenWidth *0.4,height: 54,),
                  CustomButton(buttonText: "Sign up",width: screenWidth *0.4,height: 54,backgroundColor: const Color(0XFF000000),borderColor: const Color(0XFFCC2A1B),
                  onTap: () {
                    navigateTo(context, SignUpPage());
                  },),
              ],),
              const SizedBox(height: 20),
              ordevider(),
              const SizedBox(height: 20),
              // Social Media Buttons (Custom Widget)
              const SocialMediaButtons(),
             
              // Note
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(  // تأكد من توسيط النص
                  child: RichText(
                    textAlign: TextAlign.center, // توسيط النص داخل RichText
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 10), // النص الافتراضي
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Note: This account is governed by our ', // جزء من النص العادي
                        ),
                        TextSpan(
                          text: 'Privacy Policy', // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // يمكنك إضافة هنا حدث عند الضغط على الزر
                          },
                        ),
                        const TextSpan(
                          text: ' and ', // جزء من النص العادي
                        ),
                        TextSpan(
                          text: 'Terms & Conditions', // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // يمكنك إضافة هنا حدث عند الضغط على الزر
                          },
                        ),
                        const TextSpan(
                          text: '. By using this app, you agree to comply with these policies.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
