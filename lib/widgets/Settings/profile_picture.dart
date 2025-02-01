import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/controller/setting_controller.dart';

/// [ProfilePicture] Widget for displaying and editing the profile picture
class ProfilePicture extends StatelessWidget {
  final SettingController controller;
  final double secreenheight;

  ProfilePicture({required this.controller, required this.secreenheight});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: secreenheight * 0.095,
      backgroundColor: Color(lightGrey),
      child: Stack(
        children: [
          InkWell(
              onTap: () => controller.showImagePickerOptions(context),
              child: Icon(
                Icons.person,
                size: secreenheight * 0.15,
                color: const Color(meduimGrey),
              )),
          PositionedDirectional(
            bottom: 0,
            end: 5,
            child: Icon(CupertinoIcons.pencil,
                size: 50, color: const Color.fromARGB(255, 245, 16, 0)),
          )
        ],
      ),
    );
  }
}
