import 'package:flutter/material.dart';

import '../view/splash_secreen.dart';

class MaterialAppUtills extends StatelessWidget {
  const MaterialAppUtills({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      home: const SplashSecreen(title: 'Splash Screen'),
      debugShowCheckedModeBanner: false,
    );
  }
}
