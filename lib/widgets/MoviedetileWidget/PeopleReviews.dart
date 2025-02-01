import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Core/custom_list_tile.dart';

class PeopleReviews extends StatelessWidget {
  final int count;

  const PeopleReviews({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CustomTile(
            image: "assets/image/movie_logo.png",
            title: "Film name".tr(),
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            pagenum: index + 1,
            numOfPage: count,
          ),
        );
      },
    );
  }
}
