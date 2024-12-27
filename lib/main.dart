import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_movie/utils/material_app.dart';

import 'model/boxes.dart';
import 'model/login_token.dart';
import 'model/user.dart';
// استيراد صفحة البداية الحقيقية

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoginTokenAdapter());
  Boxes.boxUser = await Hive.openBox<User>("myUsers");
  Boxes.boxToken = await Hive.openBox<LoginToken>("myToken");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialAppUtills();
  }
}
