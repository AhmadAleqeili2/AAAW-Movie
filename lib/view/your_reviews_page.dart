import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Core/custom_list_tile.dart';

class YourReviewsPage extends StatefulWidget {
  
  @override
  State<YourReviewsPage> createState() => _YourReviewsPageState();
}

class _YourReviewsPageState extends State<YourReviewsPage> {
  int count = 101;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomTile(
                image: "assets/image/movie_logo.png",
                title: "Film name",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                pagenum: index,
                numOfPage: count,
              ),
            );
          },
        ),
      ),
    );
  }
}
