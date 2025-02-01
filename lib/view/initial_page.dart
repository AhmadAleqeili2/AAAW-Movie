import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/move_between.dart';

/// [InitialPage]
/// Determines the initial page based on login token status.
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dynamicToken = Boxes.boxToken.isNotEmpty ? Boxes.boxToken.getAt(0) : null;
    LoginToken? token;

    if (dynamicToken is LoginToken) {
      token = dynamicToken;
    } else if (dynamicToken != null) {
      print('Stored value is not a LoginToken.');
    }

    final currentDate = DateTime.now();

    // If no token exists, navigate to LoginPage
    if (Boxes.boxToken.isEmpty) {
      return LoginPage();
    } 
    // If token exists but expired, show session expiration dialog
    else if (token != null && currentDate.isAfter(token.expiryDate)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(ConstantNames.sessionExpired.tr()),
              content: Text(ConstantNames.loginAgain.tr()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(ConstantNames.ok.tr()),
                ),
              ],
            );
          },
        );
      });
      return Container(); // Return an empty container while the dialog is shown
    } 
    // If token is valid, navigate to HomePage
    else {
      return MoveBetween();
    }
  }
}
