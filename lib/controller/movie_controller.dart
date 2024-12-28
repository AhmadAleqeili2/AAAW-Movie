import 'package:just_movie/services/api.dart';

class MovieController {
  ///[getAllMovies] retrive all movies
  Future<void> getAllMovies() async {
    ApiServices.get(url: "");
  }
}
