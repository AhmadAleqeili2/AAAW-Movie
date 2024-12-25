import 'package:flutter/material.dart';
import 'pages/splash_secreen.dart'; // استيراد صفحة البداية
 // استيراد صفحة البداية الحقيقية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      home: const SplashSecreen(title: 'Splash Screen'),
      debugShowCheckedModeBanner: false,
    );
  }
}
