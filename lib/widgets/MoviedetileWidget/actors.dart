import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';

final List<Map<String, String>> ActorsImage = [
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

Widget actors(List<String> ActorsData, int NumOfActors) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment(-0.9, 0),
        child: Text(
          ConstantNames.actors.tr(), // النص المطلوب
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal, // تفعيل التمرير الأفقي
        child: Row(
          children: List.generate(NumOfActors, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0XFF414141),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(ActorsData[index],
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 39,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(ActorsImage[index % 4]["image"]!),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    ],
  );
}
