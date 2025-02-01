import 'package:just_movie/constant/ages.dart';
import 'package:just_movie/constant/genre.dart';

class FilterOptions {
  static final List<String> genreFilterOption = [
    Genres.Genre,
    Genres.Action,
    Genres.Drama,
    Genres.Comedy,
    Genres.Horror
  ];
  static final List<String> AgeFilterOption = [
    Ages.Age,
    Ages.PG13,
    Ages.TVMA,
    Ages.R,
    Ages.TV14,
    Ages.TVPG
  ];
}
