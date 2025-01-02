import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/widgets/MoviedetileWidget/Epsoid.dart';
import 'package:just_movie/widgets/MoviedetileWidget/PeopleReviews.dart';
import 'package:just_movie/widgets/MoviedetileWidget/ReviewSection.dart';
import 'package:just_movie/widgets/MoviedetileWidget/episode_details.dart';
import 'package:just_movie/widgets/MoviedetileWidget/mainImage_section.dart';
import 'package:just_movie/widgets/MoviedetileWidget/actors.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';
import 'package:just_movie/widgets/scrolled_list_widget.dart';

import '../controller/movie_controller.dart';

final List<Map<String, String>> Actors = [
  {
    "image":
        "https://images.mubicdn.net/images/cast_member/2184/cache-2992-1547409411/image-w856.jpg",
    "name": "Tom Cruise",
    "age": "62"
  },
  {
    "image":
        "https://images.squarespace-cdn.com/content/v1/5f58b0094108a94a07e7dbd2/1632133685347-ZUAF7GIW5G6Z3JCRSKDE/LDC+Image+for+web.jpg",
    "name": "Leonardo DiCaprio",
    "age": "50"
  },
  {
    "image":
        "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/1366_v9_bc.jpg",
    "name": "Brad Pitt",
    "age": "61"
  },
  {
    "image":
        "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MjEwOTc3Mjc4ODI0Mjk0MjI1/morgan-freeman.jpg",
    "name": "Morgan Freeman",
    "age": "87"
  }
];

final List<Map<String, String>> items = [
  {
    "image": "assets/image/movie_logo.png",
    "title": "Alp Arslan",
    "day": "thursday",
    "season": "5",
    "star": "4.7/5",
    "desc":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
  },
  {"image": "assets/image/movie_logo.png", "title": "Payitaht"},
  {"image": "assets/image/movie_logo.png", "title": "Kudüs Fatihi"},
  {"image": "assets/image/movie_logo.png", "title": "Selahaddin"},
];

class MovieDetile extends StatefulWidget {
  const MovieDetile({Key? key, required this.movie}) : super(key: key);
  final Media movie;

  @override
  _MovieDetileState createState() => _MovieDetileState();
}

class _MovieDetileState extends State<MovieDetile> {
  Widget conWidget = Epsoid(
    Number_Of_Eps: 4,
    Eps_data: items,
  );
  Widget EpsWidget = Epsoid(
    Number_Of_Eps: 4,
    Eps_data: items,
  );
  int isSelected = 0;
  int count = 5;
  double value = 0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainImageSection(
                Image: widget.movie.image,
                youtubeVideoId: widget.movie.video,
                isClicked: false,
              ),
              SizedBox(height: 20),
              EpisodeDetails(Data: widget.movie,),
              SizedBox(height: 20),
              ScrolledButtonList(
                notSelectedColor: Color.fromARGB(100, 217, 217, 217),
                isSelectedColor: Color.fromARGB(200, 255, 255, 255),
                selectedButtonTop: isSelected,
                width: 75,
                Bnames: ["Episodes".tr(), "Actors".tr(), "Seasons".tr(), "Explore".tr()],
                BPress: [
                  () {
                    setState(() {
                      isSelected = 0;
                      conWidget = EpsWidget;
                    });
                  },
                  () {
                    setState(() {
                      isSelected = 1;
                      conWidget = actors(widget.movie.cast, Actors.length);
                    });
                  },
                  () {
                    setState(() {
                      isSelected = 2;
                      conWidget = ScrolledListWidget(
                          items: MovieController.media, title: "Seasons".tr());
                    });
                  },
                  () {
                    setState(() {
                      isSelected = 3;
                      conWidget = ScrolledListWidget(
                          items: MovieController.media, title: "Explore".tr());
                    });
                  },
                ],
              ),
              SizedBox(height: 20),
              conWidget,
              ReviewSection(
                reviewController: _reviewController,
                ratingValue: value,
                onRatingChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
              PeopleReviews(count: count),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
