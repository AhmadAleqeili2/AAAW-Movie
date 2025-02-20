import 'package:flutter/material.dart';

class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2250),
    reverseTransitionDuration: Duration(milliseconds: 1250),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: animation,
        child: child,
      );
    },
  );
}