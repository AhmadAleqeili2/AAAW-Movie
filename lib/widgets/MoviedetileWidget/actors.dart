import 'package:flutter/material.dart';

Widget actors (List<Map<String,String>> ActorsData,int NumOfActors){
  return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment(-0.9, 0),
            child: Text(
              "Actors", // النص المطلوب
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),),
          
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
                            Text(ActorsData[index]["name"]!, style: TextStyle(color: Colors.white, fontSize: 11)),
                            Text(ActorsData[index]["age"]!, style: TextStyle(color: Colors.white, fontSize: 11)),
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
                              image: NetworkImage(ActorsData[index]["image"]!),
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

