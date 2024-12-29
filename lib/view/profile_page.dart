import 'package:flutter/material.dart';
import 'package:just_movie/widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = 4;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14159), // قلب الصورة أفقيًا
                  child: Image.asset(
                    'assets/image/Logo.png', // استبدل بمسار الشعار الخاص بك
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 28),
                  onPressed: () {
                    // منطق الإعدادات هنا
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundColor: Color(0XFFD9D9D9),
              child: Icon(
                Icons.person,
                size: 130,
                color: const Color(0xFF6F6F6F),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'User Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '~ Any text like status ~',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last watched',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Vikings Season 5 | Episode 7 | 00:25:23',
                    style: TextStyle(
                      color: Color(0XFFB4B4B4),
                      fontSize: 14,
                    ),
                  ),
                
               
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/image/movie_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 175,
              child: Stack(
                children: [
                  Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 70,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your reviews',
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
                    title:"Film name'",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    pagenum: index,numOfPage: count,
                  ),
                );
              },
              
            ),
            SizedBox(height: 20,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                  color:Color(0xFF252525),
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                
              ),
              Positioned(
                
                bottom: -4,
                child:TextButton(onPressed: (){}, 
                child: Text(".....",style: TextStyle(fontSize: 30,color: Colors.white),)))
            
            
            ],
          ),
          SizedBox(height:200 ,)
          
          ],
        ),
      ),
    );
  }
}








