import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/pages/login_page.dart';


class SplashSecreen extends StatefulWidget {
  const SplashSecreen({super.key, required this.title});

  final String title;

  @override
  State<SplashSecreen> createState() => _SplashSecreenState();
}

class _SplashSecreenState extends State<SplashSecreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: primarycolor,
        alignment: Alignment.center,
        child: Image.asset('assets/image/Logo.png'), 
      ),
    );
  }
}
