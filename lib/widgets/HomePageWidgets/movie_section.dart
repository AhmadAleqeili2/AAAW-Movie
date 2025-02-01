
import 'package:flutter/material.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/view/movie_list.dart';
import 'package:just_movie/widgets/Core/scrolled_list_widget.dart';

/// [MovieSection]
/// Displays a section of movies in a horizontal scrollable list.
class MovieSection extends StatelessWidget {
  final String title;
  final List<Media> mediaList;

  const MovieSection({
    required this.title,
    required this.mediaList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrolledListWidget(
      items: mediaList,
      title: title,
      arrowPage: MovieListView(mediaData: mediaList),
      WithArrow: true,
    );
  }
}