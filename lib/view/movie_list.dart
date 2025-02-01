import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/widgets/Core/movie.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/media.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key, required this.mediaData});
  final List<Media>? mediaData;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();

    // Simulating a delay to mimic data loading
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _enabled = false; // Turn off skeleton after data is loaded
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(backgroundColor: primarycolor,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimationLimiter(
          child: Skeletonizer(
            enabled: _enabled,
            enableSwitchAnimation: true,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: List.generate(
                widget.mediaData?.length??0,
                (index) => MoviewWidget(
                  index: index,
                  url: widget.mediaData![index].image,
                  data: widget.mediaData![index].title,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
