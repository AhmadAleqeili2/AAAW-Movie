import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/model/movie.dart';

class MovieController extends ChangeNotifier {
  static List<Media> media=[];
  void getAllMedia() {
    for (var element in mediaData) {
      media.add(Media.fromJson(element));
    }
    notifyListeners();
  }
}
