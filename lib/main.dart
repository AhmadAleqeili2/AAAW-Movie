import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'model/boxes.dart';
import 'model/login_token.dart';
import 'model/user.dart';
import 'utils/provider.dart';
// استيراد صفحة البداية الحقيقية

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoginTokenAdapter());

  Boxes.boxToken = await Hive.openBox<LoginToken>("myTokens");

  Boxes.boxUser = await Hive.openBox<User>("myUsers");

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'Ar'),
      ],
      fallbackLocale: Locale('en', 'US'),
      path: 'resources/langs',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderUtils();
  }
}
