import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/view/home_page1.dart';
import 'package:just_movie/view/profile_page.dart';
import 'package:just_movie/view/search_page.dart';
import 'package:just_movie/widgets/bottom_navigation_bar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _selectedIndex = 0;

  // تحديث الـ body بناءً على الـ index المحدد
  List<Widget> _pages = [
    HomePageBody(),  // الصفحة الرئيسية
    SearchPage(),    // صفحة البحث
    Container(),     // صفحة القائمة المفضلة (محتوى فارغ حالياً)
    ProfilePage(),     // صفحة الملف الشخصي (محتوى فارغ حالياً)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: _pages[_selectedIndex], // عرض الصفحة حسب الـ selectedIndex
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}






