import 'package:just_movie/model/media.dart';
import 'user.dart';

class FavouriteMovie {
  User user;
  Media media;

  FavouriteMovie({required this.user, required this.media});

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'media': media.toJson(),
    };
  }

  factory FavouriteMovie.fromJson(Map<String, dynamic> json) {
    return FavouriteMovie(
      user: User.fromJson(json['user']),
      media: Media.fromJson(json['media']),
    );
  }
}
