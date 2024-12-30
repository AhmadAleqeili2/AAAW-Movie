import 'package:flutter/material.dart';

Widget actors (){
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
              children: List.generate(10, (index) {
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
                            Text("Burak Özçivit", style: TextStyle(color: Colors.white, fontSize: 11)),
                            Text(" Age : 39", style: TextStyle(color: Colors.white, fontSize: 11)),
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
                              image: NetworkImage("https://www.dmeprolink.com/wp-content/uploads/2020/03/FDH-576C.png"),
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

