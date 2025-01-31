import 'package:flutter/material.dart';
import 'package:just_movie/constant/ages.dart';
import 'package:just_movie/constant/genre.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/view/search_page.dart';
import 'package:just_movie/widgets/Search/search_result_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../model/media.dart';

class SearchsController extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  late stt.SpeechToText speech;
  bool isListening = false;
  String selectedFilter = Genres.Genre;
  String selectedFilter2 = Ages.Age;

  List<Media> filteredMedia = [];
  bool isFilter = false;

  void applyFilter() {
    filteredMedia = MovieController.media.where((item) {
      // Check title
      bool matchesTitle =
          item.title.toLowerCase().contains(controller.text.toLowerCase());

      // Check genre filter (ignore if 'Genre' is selected)
      bool matchesGenre =
          selectedFilter == Genres.Genre || item.genre.contains(selectedFilter);

      // Check age rating filter (ignore if 'Age' is selected)
      bool matchesAgeRating =
          selectedFilter2 == Ages.Age || item.ageRating == selectedFilter2;

      // Return true only if all conditions are met
      return matchesTitle && matchesGenre && matchesAgeRating;
    }).toList();
    notifyListeners();
  }

  void startListening(BuildContext context) async {
    bool available = await speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      isListening = true;
      notifyListeners();
      speech.listen(
        onResult: (val) {
          controller.text = val.recognizedWords;
          if (!val.hasConfidenceRating && val.recognizedWords.isNotEmpty) {
            search(context);
          }
          notifyListeners();
        },
      );
    }
  }

  void stopListening() {
    speech.stop();
    isListening = false;
    notifyListeners();
  }

  void search(BuildContext context) {
    if (controller.text.trim().isEmpty) {
      // Show an error message or simply return
      return;
    }

    String query = controller.text.trim();
    pastsearchs.insert(0, query);

    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(query: controller.text),
      ),
    );
  }
}
