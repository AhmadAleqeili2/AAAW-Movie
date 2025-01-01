import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/model/media.dart';

class MovieController  {
  static List<Media> media = [];
  void getAllMedia() {
    Future.delayed(Duration(seconds: 2));

    for (var element in mediaData) {
      media.add(Media.fromJson(element));
    }
  }
}
