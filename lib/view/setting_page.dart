import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/widgets/Buttons/custom_button.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
     
      double secreenheight = MediaQuery.of(context).size.height;
      double secreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black, // يمكنك تغيير لون الخلفية حسب رغبتك
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: secreenheight *0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: secreenheight *0.03),
                  onPressed: () {
                    Navigator.pop(context); // للعودة إلى الصفحة السابقة
                  },
                ),
              ],
            ),
            SizedBox(height: secreenheight *0.02),
            CircleAvatar(
              radius: secreenheight *0.095,
              backgroundColor: Color(0XFFD9D9D9),
              child: Icon(
                Icons.person,
                size: secreenheight *0.15,
                color: const Color(0xFF6F6F6F),
              ),
            ),
            SizedBox(height: secreenheight *0.02),
           Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              
              SizedBox(width: secreenWidth *0.1,),
              Column(
              children: [
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
            ),],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.edit),alignment: Alignment.bottomLeft,)
            
            ]),
          
          SizedBox(height:secreenheight * 0.04),
           GestureDetector(
            
      onTap: () {
    _showLanguageMenu(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent, // الخلفية الشفافة
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image/Language_logo.png",height:secreenWidth *0.05 ,), // أيقونة اللغة
            SizedBox(width: secreenWidth *0.03), // مسافة بين الأيقونة والنص
            Text(
              selectedLanguage,
              style: TextStyle(
                color: Colors.white,
                fontSize: secreenWidth *0.06,
              ),
            ),
            SizedBox(width: secreenWidth *0.45), // مسافة بين النص والسهم
            Icon(Icons.arrow_drop_down_outlined, color: Colors.white, size: secreenWidth *0.1), // سهم للأسفل
          ],
        ),
      ),
    ),
    SizedBox(height:secreenheight * 0.04),
    CustomButton(backgroundColor: primarycolor,borderColor: Colors.white,buttonText: "Reset Password",),
    SizedBox(height:secreenheight * 0.3),
       CustomButton(buttonText: "Delete Account",)
    
          
          ],
        ),
      ),
    );
  }
    void _showLanguageMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black, // لون خلفية القائمة
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  'English',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  'العربية',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'العربية';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
