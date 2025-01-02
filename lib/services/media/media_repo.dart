import 'package:flutter/material.dart';
import 'package:just_movie/model/media.dart';

abstract  class MediaRepo {
 Future<List<Map<String,dynamic>>>  fetchMedia(BuildContext context); // Fetch a list of media

}