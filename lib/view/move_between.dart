import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/view/home_page1.dart';
import 'package:just_movie/view/my_list.dart';
import 'package:just_movie/view/profile_page.dart';
import 'package:just_movie/view/search_page.dart';
import 'package:just_movie/widgets/MoveBetween/bottom_navigation_bar.dart';

///[MoveBetween] move between pages in button navigation barr
class MoveBetween extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MoveBetween> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomePageBody(),
    SearchPage(),
    MyListPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    MovieController movieController = MovieController();
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
      child: KeyboardDismissOnTap(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: primarycolor,
          body: _selectedIndex == 1
              ? SingleChildScrollView(child: _pages[_selectedIndex])
              : _pages[_selectedIndex], // عرض الصفحة حسب الـ selectedIndex
          bottomNavigationBar: SafeArea(
            child: BottomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
