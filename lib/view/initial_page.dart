import 'package:flutter/material.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/signup_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
var dynamicToken = Boxes.boxToken.getAt(0);
LoginToken? token;

if (dynamicToken is LoginToken) {
  token = dynamicToken;
} else {
  print('Stored value is not a LoginToken.');
}
    final currentDate = DateTime.now();

    if (Boxes.boxToken.isEmpty)
      return LoginPage();
    else if (currentDate.isAfter(token!.expiryDate)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("return Login"),
            content: Text("return login for your email"),
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
      return LoginPage();
    } else {
      return SignUpPage();
    }
  }
}
