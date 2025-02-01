
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/widgets/Core/custom_list_tile.dart';

/// [ProfileReviews]
class ProfileReviews extends StatelessWidget {
  final int count;

  ProfileReviews({required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ConstantNames.yourReview.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTile(
                    image: "assets/image/movie_logo.png",
                    title: "Film name".tr(),
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    pagenum: index + 1,
                    numOfPage: count,
                  ),
                );
              },
            ),
      ],
    );
  }
}