import 'package:flutter/material.dart';
import 'package:just_movie/model/movie.dart';

class EpisodeDetails extends StatelessWidget {
  final Media Data;
  EpisodeDetails(
    {
      super.key,
      required this.Data
    }
  );
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Data.title, style: TextStyle(fontSize: 27)),
        Text("Season " + "1"),
        SizedBox(height: 20),
        Row(
          spacing: 15,
          children: [
            MyListButton(),
            RatingColumn(star:  Data.rating.toString()),
            CalendarColumn(day: Data.releaseDate),
          ],
        ),
        SizedBox(height: 20),
        Text(Data.description),
      ],
    );
  }
}

class MyListButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
          double secreenWidth = MediaQuery.of(context).size.width;
  double secreenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: secreenHeight *0.07,
      width: secreenWidth * 0.15,
      decoration: BoxDecoration(
        color: Color(0XFF252525),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 12,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline,
                size: 30,
                color: Color(0XFFB3B3B3),
              ),
            ),
          ),
          Positioned(
            top: 40,
            child: Text(
              "My List",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingColumn extends StatelessWidget {
  final String star;

  RatingColumn({required this.star});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_border_outlined,
          size: 35,
          color: Color(0XFFB3B3B3),
        ),
        Text(
          star,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class CalendarColumn extends StatelessWidget {
  final String day;

  CalendarColumn({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 35,
          color: Color(0XFFB3B3B3),
        ),
        Text(
          day,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
