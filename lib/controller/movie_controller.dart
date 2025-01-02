import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/services/media/media_api.dart';

class MovieController {
  static List<Media> media = [];
  void getAllMedia() {
    Future.delayed(Duration(seconds: 2));

    for (var element in mediaData) {
      media.add(Media.fromJson(element));
    }
  }
}

class MediaController extends ChangeNotifier {
  static List<Media> media = [];
  void getAllMedia(BuildContext context) async {
    Future.delayed(Duration(seconds: 2));
    List<Map<String, dynamic>> mediaData = await MediaApi().fetchMedia(context);
    for (var element in mediaData) {
      media.add(Media.fromJson(element));
    }
    notifyListeners();
  }
}
