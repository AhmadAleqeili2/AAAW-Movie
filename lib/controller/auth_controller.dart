import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/view/login_page.dart';

import '../model/user.dart';

class AuthController {
  void signUp(User user, BuildContext context) {
    print(user.email());
    print(user.password());
    print(user.gender());

    Boxes.boxUser.put("K_${user.email}", user);
    navigateTo(context, LoginPage());
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    print(email);
    print(password);
    print('adadas');
    if (Boxes.boxUser.keys.contains('K_$email')) {
      User user = Boxes.boxUser.get('K_$email');
      if (user.password == password) {
        Boxes.boxUser.put(
            "K_$email",
            LoginToken(
                token: Random.secure().toString(),
                expiryDate: DateTime.now().add(const Duration(days: 3))));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Successful")),
        );
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
