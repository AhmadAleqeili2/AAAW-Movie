import 'package:flutter/material.dart';
import 'package:just_movie/model/media.dart';

// [EpisodeDetails]
class EpisodeDetails extends StatelessWidget {
  final Media Data;
  final bool isSelected;

  const EpisodeDetails({
    Key? key,
    required this.Data,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ...existing code...
    );
  }
}
