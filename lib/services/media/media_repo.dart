import 'package:flutter/material.dart';

abstract  class MediaRepo {
 Future<List<Map<String,dynamic>>>  fetchMedia(BuildContext context); // Fetch a list of media

}