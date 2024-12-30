import 'package:flutter/material.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';

class MainImagWidget extends StatefulWidget {
  final List<Map<String, String>> items;
  final bool withupperbuttons;
  final bool withlowerbuttons;
  const MainImagWidget(
      {Key? key,
      required this.items,
      this.withupperbuttons = false,
      this.withlowerbuttons = false})
      : super(key: key);

  @override
  State<MainImagWidget> createState() => _MainImagWidgetState();
}

class _MainImagWidgetState extends State<MainImagWidget> {
  int selectedButtonButtom = 0; // متابعة حالة الزر النشط
  int selectedButtonTop = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.items[selectedButtonButtom]["image"]!),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),
            ),
          ),
        ),
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
        if (widget.withlowerbuttons) ...[
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
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedButtonButtom = index; // تغيير حالة الزر
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 60,
                      height: 4,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedButtonButtom == index
                            ? const Color.fromARGB(
                                140, 255, 255, 255) // أقل شفافية عند التحديد
                            : const Color.fromARGB(
                                50, 255, 255, 255), // أبيض شفاف عند عدم التحديد
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
        // الشريط العلوي القابل للتمرير
        if (widget.withupperbuttons) ...[
          ScrolledButtonList(
            withlogo: true,
            selectedButtonButtom: selectedButtonTop,
            BPress: [
              () {
                setState(() {
                  selectedButtonTop = 0;
                });
              },
              () {
                setState(() {
                  selectedButtonTop = 1;
                });
              },
              () {
                setState(() {
                  selectedButtonTop = 2;
                });
              },
              () {
                setState(() {
                  selectedButtonTop = 3;
                });
              }
            ],
          )
        ],
      ],
    );
  }
}
