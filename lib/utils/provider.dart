import 'package:flutter/material.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/utils/material_app.dart';
import 'package:provider/provider.dart';

import '../controller/favourit_media.dart';
import '../controller/search_controller.dart';

class ProviderUtils extends StatelessWidget {
  const ProviderUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => MediaController()),
        ChangeNotifierProvider(create: (context) => FavouritMediaController()),
        ChangeNotifierProvider(create: (context) => SearchsController())
      ],
      child: MaterialAppUtills(),
    );
  }
}
