
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/model/user.dart';

/// [ProfileAvatar]
class ProfileAvatar extends StatelessWidget {
  final User? user;

  ProfileAvatar({required this.user});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundColor: const Color(lightGrey),
      child: user?.image() != null
          ? ClipOval(
              child: Image.asset(
                user!.image()!,
                fit: BoxFit.cover,
                width: 160,
                height: 160,
              ),
            )
          : Icon(
              Icons.person,
              size: 130,
              color: const Color(meduimGrey),
            ),
    );
  }
}