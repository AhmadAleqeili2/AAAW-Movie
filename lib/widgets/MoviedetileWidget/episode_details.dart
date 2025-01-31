import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/widgets/MoviedetileWidget/calender_column.dart';
import 'package:just_movie/widgets/MoviedetileWidget/my_list_button.dart';
import 'package:just_movie/widgets/MoviedetileWidget/rating_column.dart';

class EpisodeDetails extends StatelessWidget {
  final Media Data;
  final bool isSelected;
  EpisodeDetails({super.key, required this.Data, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Data.title, style: TextStyle(fontSize: 27)),
        Text(ConstantNames.seasons.tr() + "1"),
        SizedBox(height: 20),
        Row(
          spacing: 15,
          children: [
            MyListButton(
              isSelected: isSelected,
            ),
            RatingColumn(star: Data.rating.toString()),
            CalendarColumn(day: Data.releaseDate),
          ],
        ),
        SizedBox(height: 20),
        Text(Data.description),
      ],
    );
  }
}


