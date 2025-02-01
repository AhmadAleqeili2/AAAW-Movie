import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/controller/setting_controller.dart';
import 'package:just_movie/widgets/Core/custom_button.dart';
import 'package:provider/provider.dart';
import '../widgets/Settings/profile_picture.dart';
import '../widgets/Settings/user_info.dart';
import '../widgets/Settings/language_selector.dart';

/// [SettingPage] Main settings page
class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    SettingController controller = Provider.of<SettingController>(context);
    double secreenheight = MediaQuery.of(context).size.height;
    double secreenWidth = MediaQuery.of(context).size.width;
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: secreenheight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.white, size: secreenheight * 0.03),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: secreenheight * 0.02),
              ProfilePicture(controller: controller, secreenheight: secreenheight),
              SizedBox(height: secreenheight * 0.02),
              UserInfo(controller: controller, secreenWidth: secreenWidth),
              SizedBox(height: secreenheight * 0.04),
              LanguageSelector(controller: controller, secreenWidth: secreenWidth),
              SizedBox(height: secreenheight * 0.04),
              CustomButton(
                  backgroundColor: primarycolor,
                  borderColor: Colors.white,
                  buttonText: ConstantNames.resetPassword.tr(),
                  onTap: () =>
                      controller.resetPassword(context, passController)),
              SizedBox(height: secreenheight * 0.04),
              CustomButton(
                backgroundColor: primarycolor,
                borderColor: Colors.white,
                buttonText: ConstantNames.logOut.tr(),
                onTap: () => UserController().logout(context),
              ),
              SizedBox(height: secreenheight * 0.25),
              CustomButton(
                buttonText: ConstantNames.deleteAccount.tr(),
                onTap: () {
                  UserController().deleteAccount(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
