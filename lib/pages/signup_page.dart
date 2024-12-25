import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/widgets/custom_button.dart';
import 'package:just_movie/widgets/custom_text_fields.dart';
import 'package:just_movie/widgets/gender_options.dart';

TextEditingController genderController = TextEditingController();
bool isChecked = false;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              // Logo (أو أي شيء تود إضافته أعلى الصفحة)
              Image.asset(
                'assets/image/Logo.png',
                height: 200,
              ),
              const SizedBox(height: 40),

              // First Name and Last Name Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    hintText: 'First Name',
                    width: screenWidth * 0.4,
                    height: 50,
                    fillColor: const Color(0xff222222),
                    hintTextColor: const Color(0XFFFFFFFF),
                  ),
                  CustomTextField(
                    hintText: 'Last Name',
                    width: screenWidth * 0.4,
                    height: 50,
                    fillColor: const Color(0xff222222),
                    hintTextColor: const Color(0XFFFFFFFF),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Age and Gender Fields

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    hintText: 'Age',
                    width: screenWidth * 0.4,
                    height: 50,
                    fillColor: const Color(0xff222222),
                    hintTextColor: const Color(0XFFFFFFFF),
                  ),
                  GenderDropdown(
                    controller: genderController,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // E-mail and Password Fields
              CustomTextField(
                hintText: 'E-Mail',
                fillColor: const Color(0xff222222),
                hintTextColor: const Color(0XFFFFFFFF),
                width: screenWidth * 0.85,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                fillColor: const Color(0xff222222),
                hintTextColor: const Color(0XFFFFFFFF),
                width: screenWidth * 0.85,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                fillColor: const Color(0xff222222),
                hintTextColor: const Color(0XFFFFFFFF),
                width: screenWidth * 0.85,
              ),

              Row(
                children: [
                  Checkbox(
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (!isChecked) { 
                        return primarycolor;
                      } else {
                        return const Color.fromARGB(
                            255, 48, 47, 47); // اللون عند عدم التحديد
                      }
                    }),
                    checkColor: Colors.red,
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = value ?? false;
                      setState(() {});
                    },
                  ),


                  RichText(
                    textAlign: TextAlign.center, // توسيط النص داخل RichText
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white, fontSize: 10), // النص الافتراضي
                      children: <TextSpan>[
                        const TextSpan(
                          text:
                              'I have read and agree to the ', // جزء من النص العادي
                        ),
                        TextSpan(
                          text: 'Privacy Policy', // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // يمكنك إضافة هنا حدث عند الضغط على الزر
                            },
                        ),
                        const TextSpan(
                          text: ' and ', // جزء من النص العادي
                        ),
                        TextSpan(
                          text:
                              'Terms & Conditions', // جزء من النص الذي سيكون زر
                          style: const TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // يمكنك إضافة هنا حدث عند الضغط على الزر
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              // Create Account Button
              CustomButton(
                buttonText: 'Create Account',
                backgroundColor: const Color(0XFFCC2A1B),
                height: 50,
                borderColor: const Color(0XFFCC2A1B),
                borderWidth: 2,
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
