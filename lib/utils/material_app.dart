import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../view/splash_secreen.dart';

class MaterialAppUtills extends StatelessWidget {
  const MaterialAppUtills({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Movie',
      home: MyCustomSplashScreen(),
      debugShowCheckedModeBanner: false,
      //new for Asem And Walid
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
