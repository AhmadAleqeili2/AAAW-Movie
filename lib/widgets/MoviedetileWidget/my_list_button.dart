
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';

class MyListButton extends StatelessWidget {
  const MyListButton({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    double secreenWidth = MediaQuery.of(context).size.width;
    double secreenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: secreenHeight * 0.07,
      width: secreenWidth * 0.15,
      decoration: BoxDecoration(
        color: Color(0XFF252525),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 12,
            child: IconButton(
                onPressed: () {},
                icon: isSelected
                    ? IconButton(
                        icon: Icon(Icons.delete_rounded),
                        iconSize: 30,
                        color: Color(0XFFB3B3B3),
                        onPressed: () {},
                      )
                    : IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 30,
                        color: Color(0XFFB3B3B3),
                        onPressed: () {},
                      )),
          ),
          Positioned(
            top: 40,
            child: Text(
             ConstantNames .myList.tr(),
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}