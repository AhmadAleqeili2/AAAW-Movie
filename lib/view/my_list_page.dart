import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/view/your_reviews_page.dart';
import 'package:just_movie/widgets/custom_list_tile.dart';
import 'package:just_movie/widgets/epsoid_tile.dart';
import 'package:just_movie/widgets/main_imag_widget.dart';
import 'package:just_movie/widgets/scrolled_button_list.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  Widget conWidget = epsoid();
  int isSelected = 0;
  int count = 5;
  dynamic _value;
  TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: primarycolor,
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: screenHeight * 0.40,
                    width: screenWidth,
                    child: Stack(
                      children: [
                        MainImagWidget(
                          items: items,
                        ),
                        Positioned(
                            top: 90,
                            left: 90,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 200,
                                  color: Colors.red,
                                )))
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[0]["title"]!,
                          style: TextStyle(fontSize: 27),
                        ),
                        Text("Season " + items[0]["season"]!)
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  spacing: 30,
                  children: [
                    Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.15,
                      decoration: BoxDecoration(
                          color: Color(0XFF252525),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                  ))),
                          Positioned(
                              top: 40,
                              child: Text(
                                "My List",
                                style: TextStyle(fontSize: 10),
                              ))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          size: 35,
                          color: Color(0XFFB3B3B3),
                        ),
                        Text(
                          items[0]["star"]!,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 35,
                          color: Color(0XFFB3B3B3),
                        ),
                        Text(
                          items[0]["day"]!,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(items[0]["desc"]!),
                SizedBox(
                  height: 20,
                ),
                ScrolledButtonList(
                  notSelectedColor: Color.fromARGB(100, 217, 217, 217),
                  isSelectedColor: Color.fromARGB(200, 255, 255, 255),
                  selectedButtonTop: isSelected,
                  width: 75,
                  Bnames: ["Episodes", "Actors", "Seasons", "Explore"],
                  BPress: [
                    //كل زر شو بعمل بالترتيب
                    () {
                      setState(() {
                        isSelected = 0;
                        conWidget = epsoid();
                      });
                    },
                    () {
                      setState(() {
                        isSelected = 1;
                      });
                    },

                    () {
                      setState(() {
                        isSelected = 2;
                      });
                    },

                    () {
                      setState(() {
                        isSelected = 3;
                      });
                    },
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                conWidget,
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          color: Color(0xFF252525),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    Positioned(
                        bottom: -4,
                        child: TextButton(
                            onPressed: () {
                              navigateTo(context, YourReviewsPage());
                            },
                            child: Text(
                              ".....",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title text
                      Text(
                        'Review',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      // Review text field
                      TextField(
                        controller: _reviewController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'write your review',
                          hintStyle: TextStyle(color: Colors.white60),
                          filled: true,
                          fillColor: Colors.grey[800],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(height: 20),
                      // Rating Slider
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'People review',
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
                        title: "Film name'",
                        description:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        pagenum: index + 1,
                        numOfPage: count,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          color: Color(0xFF252525),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    Positioned(
                        bottom: -4,
                        child: TextButton(
                            onPressed: () {
                              navigateTo(context, YourReviewsPage());
                            },
                            child: Text(
                              ".....",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )))

                    //slider packeg
                    ,
                    SfSlider(
                      min: 1,
                      max: 5,
                      value: _value,
                      interval: 1, // تحديد الفاصل بين العلامات
                      stepSize: 1, // لضبط الحركة لتكون متطابقة مع الفاصل
                      showTicks: true, // لإظهار العلامات الصغيرة
                      showLabels: true, // لإظهار الأرقام

                      labelFormatterCallback:
                          (dynamic actualValue, String formattedText) {
                        // تخصيص نص العلامات
                        return actualValue.toInt().toString();
                      },
                      thumbShape: SfThumbShape(), // تحديد شكل النقطة الرئيسية
                      activeColor: const Color.fromARGB(
                          255, 255, 0, 0), // لون الجزء النشط
                      inactiveColor: const Color.fromARGB(
                          255, 255, 0, 0), // لون الجزء غير النشط
                      onChanged: (dynamic newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget epsoid() {
  return Column(
    children: List.generate(4, (i) {
      return Column(
        children: [
          EpisodeTile(
            image: items[0]
                ["image"]!, // استخدم مسار الصورة وفقًا للبيانات المتوفرة لديك
            title: "Epsoid ${i + 1}",
            DownloadButton: () {
              // الإجراء عند الضغط على زر التحميل
            },
            WatchButton: () {
              // الإجراء عند الضغط على زر المشاهدة
            },
          ),
          SizedBox(height: 10),
        ],
      );
    }),
  );
}
