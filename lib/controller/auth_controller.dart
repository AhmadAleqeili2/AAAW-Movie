import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/move_between.dart';

import '../model/user.dart';

class AuthController {
  /// [signUp] giving a user data and put it in user box and generate objective id then navigate to login page
  void signUp(User user, BuildContext context) {
    print(user.email());
    print(user.password());
    print(user.gender());

    Boxes.boxUser.put(user.email(), user);
    navigateTo(context, LoginPage());
  }

  ///[login] check if user is exist and  password does match with your account
  ///if  is exist will generate a token for login
  ///if not exist will return snack bar
  Future<void> login(
      String email, String password, BuildContext context) async {
    print(email);
    print(password);
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
            "K_$email",
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
}
