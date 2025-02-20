import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavigationBarWidget({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: Colors.grey[900],
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: onItemTapped,  // إضافة onTap هنا
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ConstantNames.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label:ConstantNames.search.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: ConstantNames.myList.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: ConstantNames.profile.tr(),
            ),
          ],
        ),
      ),
    );
  }
}