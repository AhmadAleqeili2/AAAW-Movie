import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int pagenum;
  final int numOfPage;
  CustomTile({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pagenum,
    required this.numOfPage
});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0XFF252525),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          // الجزء الأيسر: الصورة والتقييم
          Column(
            children: [
              // صورة مصغرة للفيلم
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  image, // استبدل بالرابط الخاص بالصورة
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
             
            ],
          ),
          SizedBox(width: 10), // مسافة صغيرة بين العمودين
          // الجزء الأيمن: اسم الفيلم والوصف
          
             Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$title\n$pagenum/$numOfPage',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,color: Colors.grey[700],
                  ),
                ),
                
              ],
                         ),
            SizedBox(width: 10,),
           Expanded(child:Text(
               'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
               style: TextStyle(
                 fontSize: 10,
                 
               ),
               maxLines: 3,
               overflow: TextOverflow.ellipsis,
             )
           
                     ),
          IconButton(
                        icon: Image.asset("assets/image/edit_icon.png",height: 25,),
                        onPressed: () {},
                      ),

          
        ],
      ),
    );
  }
}