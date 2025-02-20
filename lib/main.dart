import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_movie/utils/restart.dart';

import 'model/boxes.dart';
import 'model/login_token.dart';
import 'model/user.dart';
// استيراد صفحة البداية الحقيقية
import 'utils/provider.dart';
void main() async {
    // await dotenv.load(); // Load the .env file

  //new for Walid and asem
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoginTokenAdapter());

  Boxes.boxToken = await Hive.openBox<LoginToken>("myTokens");

  Boxes.boxUser = await Hive.openBox<User>("myUsers");

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('en'),
      path: 'assets/lang',
      child: KeyboardVisibilityProvider(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return utilsREstart(child: ProviderUtils());
  }
}
