import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/services/navigate.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/services/user/user_api.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/move_between.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../model/user.dart';
import "dart:developer" as developer;

class UserController {
  /// [signUp] giving a user data and put it in user box and generate objective id then navigate to login page
  void signUp(User user, BuildContext context) {
    Boxes.boxUser.put(user.email().toString(), user); // Ensure key is a string
    navigateTo(context, LoginPage());
  }

  void appleSignIn() async {
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
      print('Full Name: ${credential.givenName} ${credential.familyName}');
    } catch (error) {
      // Handle error
      print('Sign in with Apple failed: $error');
    }
  }
void googleSignIn(BuildContext context)async{
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
}
void facebookSignIn(BuildContext context){
   // Show a dialog when the button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(ConstantNames.comingSoonTitle.tr()),
                  content: Text(ConstantNames.comingSoonMessage.tr()),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(ConstantNames.ok.tr()),
                    ),
                  ],
                );
              },
            );
}
  // Goto SignUp Page
  void navigateToSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  bool validateAndSave(GlobalKey<FormState> key) {
    final form = key;
    if (form.currentState!.validate()) {
      form.currentState!.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit(
      String email, BuildContext context, GlobalKey<FormState> key) {
    if (validateAndSave(key)) {
      if (UserController().checkAccountValidation(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ConstantNames.sentEmailMessage.tr())),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ConstantNames.userNotExist.tr())),
        );
      }
    }
  }

  ///[login] check if user is exist and  password does match with your account
  ///if  is exist will generate a token for login
  ///if not exist will return snack bar
  Future<void> login(
      String email, String password, BuildContext context) async {
    bool isExist = Boxes.boxUser.containsKey(email);

    print(isExist);
    Iterable p1 = Boxes.boxUser.keys;
    for (var item in p1) {
      developer.log(item.toString()); // Ensure item is logged as a string
    }
    // print(p1?.email());
    if (isExist) {
      User user = Boxes.boxUser.get(email);
      if (user.password() == password) {
        Boxes.boxToken.put(
            email, // Ensure key is a string
            LoginToken(
                token: Random.secure().toString(),
                expiryDate: DateTime.now().add(const Duration(days: 3))));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MoveBetween(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Wrong password")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("This user does not exist")),
      );
    }
  }

  User? getUser(String key) {
    return Boxes.boxUser.get(key);
  }

  bool checkAccountValidation(String email) {
    print(email);
    bool isExist = Boxes.boxUser.containsKey(email);
    print(isExist);
    Iterable p1 = Boxes.boxUser.keys;
    for (var item in p1) {
      print(item);
    }
    return isExist;
    // print(p1?.email());
  }

  void deleteAccount(BuildContext context) {
    Boxes.boxUser.delete(Boxes.boxToken.keys.first.toString()); // Ensure key is a string
    Boxes.boxToken.clear();
    navigateTo(context, LoginPage());
  }

  void logout(BuildContext context) {
    Boxes.boxToken.clear();
    navigateTo(context, LoginPage());
  }

  void changeUserInfo(User user) {
    Boxes.boxUser.put(user.email().toString(), user); // Ensure key is a string
  }
}

class AuthController extends ChangeNotifier {
  /// Registers a new user through the API and navigates to the login page if successful.
  Future<void> registerUser(User user, BuildContext context) async {
    try {
      bool isAccepted = await UserApi().createUser(user, context);
      if (isAccepted) {
        navigateTo(context, LoginPage());
      }
    } catch (e) {
      _showSnackBar(context, 'Registration failed: $e');
    }
  }

  /// Logs in a user and navigates to the home page if successful.
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      bool isAccepted = await UserApi().Login(email, password, context);
      if (isAccepted) {
        navigateTo(context, MoveBetween());
      }
    } catch (e) {
      _showSnackBar(context, 'Login failed: $e');
    }
  }

  /// Retrieves the details of the currently logged-in user.
  Future<User?> getUser(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString("userId") ?? "";
      if (userId.isEmpty) {
        _showSnackBar(context, "User not found. Please log in.");
        return null;
      }
      return await UserApi().getUser(userId, context);
    } catch (e) {
      _showSnackBar(context, 'Failed to fetch user: $e');
      return null;
    }
  }

  /// Updates the user's information through the API.
  Future<void> updateUser(User user, BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString("userId") ?? "";
      if (userId.isEmpty) {
        _showSnackBar(context, "User not found. Please log in.");
        return;
      }
      await UserApi().updateUser(userId, user, context);
      notifyListeners();
    } catch (e) {
      _showSnackBar(context, 'Failed to update user: $e');
    }
  }

  /// Deletes the current user through the API and resets the app state.
  Future<void> deleteUser(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString("userId") ?? "";
      if (userId.isEmpty) {
        _showSnackBar(context, "User not found. Please log in.");
        return;
      }
      await UserApi().deleteUser(userId, context);
      prefs.remove("userId"); // Clear user ID from shared preferences
      notifyListeners();
      navigateTo(context, LoginPage()); // Navigate back to login after deletion
    } catch (e) {
      _showSnackBar(context, 'Failed to delete user: $e');
    }
  }

  /// Navigates to the specified page.
  void navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Helper method to show a snack bar for displaying messages.
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
