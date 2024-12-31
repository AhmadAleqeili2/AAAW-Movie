import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/view/home_page1.dart';
import 'package:just_movie/view/movie_detail_page.dart';
import 'package:just_movie/view/my_list.dart';
import 'package:just_movie/view/profile_page.dart';
import 'package:just_movie/view/search_page.dart';
import 'package:just_movie/widgets/Buttons/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomePageBody(), 
    SearchPage(),  
    MyListPage(),   
    ProfilePage(),    
  ];
  @override
  void initState() {
    MovieController movieController =
        Provider.of<MovieController>(context, listen: false);
    movieController.getAllMedia();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: primarycolor,
        body: _pages[_selectedIndex], // عرض الصفحة حسب الـ selectedIndex
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
