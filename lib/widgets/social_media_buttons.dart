import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/model/user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
            // Show a dialog when the button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Feature Coming Soon"),
                  content:
                      Text("This feature will be available in the future."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.facebook, color: Colors.white),
          label:  Text('Sign In with Facebook'.tr(),
              style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF1877F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () async {
            User user = User();
            // حدث تسجيل الدخول عبر Google
            final GoogleSignIn googleSignIn = GoogleSignIn();
            final GoogleSignInAccount? googleSignInAccount =
                await googleSignIn.signIn();
            final GoogleSignInAuthentication googleSignInAuthentication =
                await googleSignInAccount!.authentication;
            print(googleSignInAuthentication);
            user.setEmail(googleSignInAccount.email);
            user.setFirstName(googleSignInAccount.displayName ?? '');
            UserController().signUp(user, context);
          },
          icon: Image.asset("assets/image/GoogleLogo.png", height: 20),
          label: Text(
            'Sign In with Google'.tr(),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () async {
            // حدث تسجيل الدخول عبر Apple
            try {
              final credential = await SignInWithApple.getAppleIDCredential(
                scopes: [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName,
                ],
                webAuthenticationOptions: WebAuthenticationOptions(
                  clientId: 'com.example.yourapp.web', // Your Service ID
                  redirectUri: Uri.parse(
                    'https://yourapp.com/auth/callback', // Your redirect URI
                  ),
                ),
              );

              // Handle successful login
              print('User ID: ${credential.userIdentifier}');
              print('Email: ${credential.email}');
              print(
                  'Full Name: ${credential.givenName} ${credential.familyName}');
            } catch (error) {
              // Handle error
              print('Sign in with Apple failed: $error');
            }
          },
          icon: const Icon(Icons.apple, color: Colors.white),
          label:  Text(
            'Sign In with Apple'.tr(),
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
                screenWidth * 0.85, 50), // عرض الزر بنسبة 90% من عرض الشاشة
          ),
        ),
      ],
    );
  }
}
