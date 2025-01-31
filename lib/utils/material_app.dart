import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';

import '../view/splash_secreen.dart';

class MaterialAppUtills extends StatelessWidget {
  const MaterialAppUtills({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.dark;

    return MaterialApp(
      title: ConstantNames.title.tr(),
      home: MyCustomSplashScreen(),
      debugShowCheckedModeBanner: false,
      //new for Asem And Walid
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
