import 'package:hive/hive.dart';
import 'package:just_movie/model/movie.dart';

@HiveType(typeId: 3)
class FavouritMovies {
  @HiveField(0)
  List<Media>? movies;
}
