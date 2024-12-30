import 'package:flutter/material.dart';
import 'package:just_movie/view/your_reviews_page.dart';
import 'package:just_movie/widgets/MoviedetileWidget/epsoid_tile.dart';
import 'package:just_movie/widgets/Buttons/more_button.dart';


class Epsoid extends StatelessWidget {
  final int Number_Of_Eps;
  final List<Map<String,String>> Eps_data;
  Epsoid({
    super.key,
    required this.Number_Of_Eps, 
    required this.Eps_data
 } );
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,      children: [
        Column(
          spacing: 10,
          children: List.generate(Number_Of_Eps, (i) {
            return EpisodeTile(
              image: Eps_data[i]["image"]!,
              title: "Epsoid ${i+1}",
               DownloadButton: () {  }, WatchButton: () {  },
            );
          }),
        ),
      
      
      
      moreButton(context,YourReviewsPage()),
      
      ],
    );
  }
}
