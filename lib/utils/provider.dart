import 'package:flutter/material.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/utils/material_app.dart';
import 'package:provider/provider.dart';

class ProviderUtils extends StatelessWidget {
  const ProviderUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MovieController()),
    ],
    child: MaterialAppUtills(),);
  }
}
