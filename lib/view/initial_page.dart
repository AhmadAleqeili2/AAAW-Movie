import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/login_token.dart';
import 'package:just_movie/view/login_page.dart';
import 'package:just_movie/view/move_between.dart';
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

    if (Boxes.boxToken.isEmpty) {
      return LoginPage();
    } else if (token != null && currentDate.isAfter(token.expiryDate)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Session Expired".tr()),
              content: Text("Please log in again to continue.".tr()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('OK'.tr()),
                ),
              ],
            );
          },
        );
      });
      return Container(); // Return an empty container while the dialog is shown
    } else {
      return HomePage();
    }
  }
}
