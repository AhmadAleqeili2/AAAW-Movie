import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';

// ignore: must_be_immutable
class imageandbutton extends StatefulWidget {
      int selectedButtonButtom =0;
  final int currentIndex;
  int selectedButtonTop;
  List<void> UperrButton;
   imageandbutton({ Key? key 
  ,required this.currentIndex,
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
      children: [GitImage(MovieController.media[widget.currentIndex].image),
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
        Align(
          alignment: Alignment(0, 1),
          child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(50, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedButtonButtom = index; 
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 60,
                    height: 4,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: widget.selectedButtonButtom == index
                          ? const Color.fromARGB(140, 255, 255, 255) // أقل شفافية عند التحديد
                          : const Color.fromARGB(50, 255, 255, 255), // أبيض شفاف عند عدم التحديد
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        // الشريط العلوي للتمرير
        ScrolledButtonList(
          selectedButtonTop: widget.selectedButtonTop,
          withlogo: true,
          BPress: [
            () { setState(() { widget.selectedButtonTop = 0; widget.UperrButton;}); },
            () { setState(() { widget.selectedButtonTop = 1; widget.UperrButton;}); },
            () { setState(() { widget.selectedButtonTop = 2; widget.UperrButton;}); },
            () { setState(() { widget.selectedButtonTop = 3; widget.UperrButton;}); },
          ],
        ),
      ],
    );
  }
}




Widget GitImage(image){
  return         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(image),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),
            ),
          ),
        );
}