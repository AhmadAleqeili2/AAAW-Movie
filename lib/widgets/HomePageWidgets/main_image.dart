import 'package:flutter/material.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';
import 'package:just_movie/widgets/HomePageWidgets/git_image.dart';

class imageandbutton extends StatefulWidget {
  final int currentIndex;
  final int selectedButtonTop;
  final List<void Function()> UperrButton;

  imageandbutton({
    Key? key,
    required this.currentIndex,
    required this.selectedButtonTop,
    required this.UperrButton,
  }) : super(key: key);

  @override
  _imageandbuttonState createState() => _imageandbuttonState();
}

class _imageandbuttonState extends State<imageandbutton> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        GitImage(image:MovieController.media[widget.currentIndex].image),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            const Color.fromARGB(40, 0, 0, 0),
            BlendMode.darken,
          ),
          child: Image.asset(
            "assets/image/Shadow.png",
            fit: BoxFit.cover,
            height: screenHeight * 0.40,
            width: screenWidth,
          ),
        ),
        // الشريط العلوي للتمرير
        ScrolledButtonList(
          selectedButtonTop: widget.selectedButtonTop,
          withlogo: true,
          BPress: List.generate(
            widget.UperrButton.length,
            (index) => () {
              setState(() {
                widget.UperrButton[index]!();
              });
            },
          ),
        ),
      ],
    );
  }
}



