import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/services/user/user_api.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/move_between.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../services/api.dart';

class UserController {
  /// [signUp] giving a user data and put it in user box and generate objective id then navigate to login page
  void signUp(User user, BuildContext context) {
    Boxes.boxUser.put(user.email(), user);
    navigateTo(context, LoginPage());
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
      print(item);
    }
    // print(p1?.email());
    if (isExist) {
      User user = Boxes.boxUser.get(email);
      if (user.password() == password) {
        Boxes.boxToken.put(
            "$email",
            LoginToken(
                token: Random.secure().toString(),
                expiryDate: DateTime.now().add(const Duration(days: 3))));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
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
    Boxes.boxUser.delete(Boxes.boxToken.keys.first);
    Boxes.boxToken.clear();
    navigateTo(context, LoginPage());
  }

  void logout(BuildContext context) {
    Boxes.boxToken.clear();
    navigateTo(context, LoginPage());
  }

  void changeUserInfo(User user) {
    Boxes.boxUser.put(user.email(), user);
  }
}

class AuthController extends ChangeNotifier {
  /// Calls the API to register a new user.
  void registerUser(User user, BuildContext context) async {
    bool isAcept = await UserApi().createUser(user, context);
    if (isAcept) navigateTo(context, LoginPage());
  }

  /// Calls the API to log in a user and retrieves a token.
  void loginUser(String email, String password, BuildContext context) async {
    bool isAcept = await UserApi().Login(email, password, context);
    if (isAcept) navigateTo(context, HomePage());
  }

  /// Retrieves user details from the API.
  Future<User> getUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await UserApi().getUser(prefs.getString("userId")??"", context);
  }

  /// Updates user information through the API.
  Future<void> updateUser(User user, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    UserApi().updateUser(prefs.getString("userId")??'', user, context);
    notifyListeners();
  }

  /// Deletes a user through the API.
  Future<void> deleteUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    UserApi().deleteUser(prefs.getString("userId")??"", context);
    notifyListeners();
  }
}
