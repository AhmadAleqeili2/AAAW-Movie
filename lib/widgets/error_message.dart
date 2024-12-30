// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WErrorMassage extends StatelessWidget {
  WErrorMassage({super.key, required this.massage, this.callback});
  final String massage;
  void Function()? callback;
  @override
  Widget build(BuildContext context) {
    //alert for error masseges
    return Container(
      color: Colors.black,
      child: AlertDialog(
          content: Text(
            massage,
          ),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(),
              onPressed: callback,
              child: Text(
                "تم",
              ),
            ),
          ]),
    );
  }
}