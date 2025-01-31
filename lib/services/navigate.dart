import 'package:flutter/material.dart';

void navigateTo(BuildContext context,  page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
