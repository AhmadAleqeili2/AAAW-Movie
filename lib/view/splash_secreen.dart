import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_movie/utils/test-network.dart';
import 'package:just_movie/widgets/Splash/AnimatedLogo.dart';
import 'package:just_movie/widgets/Splash/AnimatedText.dart';

/// [MyCustomSplashScreen] The main splash screen widget
class MyCustomSplashScreen extends StatefulWidget {
  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 3), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => UtilsTestNetwok()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedText(
                fontSize: _fontSize,
                textOpacity: _textOpacity,
                animationValue: animation1.value,
              ),
            ],
          ),
          Center(
            child: AnimatedLogo(
              containerOpacity: _containerOpacity,
              width: _width,
            ),
          ),
        ],
      ),
    );
  }
}

