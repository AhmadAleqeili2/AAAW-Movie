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

    Boxes.boxUser.put(user.email(), user);
    navigateTo(context, LoginPage());
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    print(email);
    print(password);
    bool isExist=Boxes.boxUser.containsKey(email);
    print(isExist);
    Iterable p1 = Boxes.boxUser.keys;
   for (var item in p1){
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
