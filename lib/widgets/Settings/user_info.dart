
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/setting_controller.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/model/user.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:easy_localization/easy_localization.dart';

/// [UserInfo] Widget for displaying and editing user information
class UserInfo extends StatelessWidget {
  final SettingController controller;
  final double secreenWidth;

  UserInfo({required this.controller, required this.secreenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: secreenWidth * 0.1,
      ),
      Column(
        children: [
          controller.isNameEDiting
              ? CustomTextField(
                  fillColor: const Color(darkGrey),
                  hintText: ConstantNames.username.tr(),
                  width: secreenWidth * 0.85,
                  onSubmitted: (p0) {
                    controller.user?.setFirstName(p0 ?? '');
                    UserController()
                        .changeUserInfo(controller.user ?? User());
                    controller.isNameEDiting = false;
                  },
                )
              : Text(
                  controller.user?.firstName() ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          Text(
            controller.user?.email() ?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      IconButton(
        onPressed: () {
          controller.isNameEDiting = !controller.isNameEDiting;
        },
        icon: Icon(Icons.edit),
        alignment: Alignment.bottomLeft,
      )
    ]);
  }
}