import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // حدث تسجيل الدخول عبر فيسبوك
          },
          icon: const Icon(Icons.facebook, color: Colors.white),
          label: const Text('Sign In with Facebook',style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF1877F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // حدث تسجيل الدخول عبر Google
          },
          icon: Image.asset("assets/image/GoogleLogo.png", height: 20),
          label: const Text('Sign In with Google',),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // حدث تسجيل الدخول عبر Apple
          },
          icon: const Icon(Icons.apple, color: Colors.white),
          label: const Text('Sign In with Apple',style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
      ],
    );
  }
}
