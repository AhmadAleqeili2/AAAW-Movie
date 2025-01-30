import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/controller/setting_controller.dart';
import 'package:just_movie/widgets/Core/custom_button.dart';
import 'package:provider/provider.dart';

import '../model/boxes.dart';
import '../model/user.dart';
import '../widgets/Core/custom_text_fields.dart';

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
      backgroundColor: Colors.black, // يمكنك تغيير لون الخلفية حسب رغبتك
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
                      Navigator.pop(context); // للعودة إلى الصفحة السابقة
                    },
                  ),
                ],
              ),
              SizedBox(height: secreenheight * 0.02),
              CircleAvatar(
                radius: secreenheight * 0.095,
                backgroundColor: Color(0XFFD9D9D9),
                child: Stack(
                  children: [
                    InkWell(
                        onTap: () => controller.showImagePickerOptions(context),
                        child: Icon(
                          Icons.person,
                          size: secreenheight * 0.15,
                          color: const Color(0xFF6F6F6F),
                        )),
                    PositionedDirectional(
                      bottom: 0,
                      end: 5,
                      child: Icon(CupertinoIcons.pencil,
                          size: 50,
                          color: const Color.fromARGB(255, 245, 16, 0)),
                    )
                  ],
                ),
              ),
              SizedBox(height: secreenheight * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: secreenWidth * 0.1,
                ),
                Column(
                  children: [
                    controller.isNameEDiting
                        ? CustomTextField(
                            fillColor: const Color(0xff222222),
                            hintText: ConstantNames.username.tr(),
                            width: secreenWidth * 0.85,
                            onSubmitted: (p0) {
                              controller.user?.setFirstName(p0 ?? '');
                              UserController()
                                  .changeUserInfo(controller.user ?? User());
                              controller.isNameEDiting = false;
                              setState(() {});
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
                    setState(() {});
                  },
                  icon: Icon(Icons.edit),
                  alignment: Alignment.bottomLeft,
                )
              ]),
              SizedBox(height: secreenheight * 0.04),
              GestureDetector(
                onTap: () {
                  controller.showLanguageMenu(context);
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
                      Image.asset(
                        "assets/image/Language_logo.png",
                        height: secreenWidth * 0.05,
                      ), // أيقونة اللغة
                      SizedBox(
                          width:
                              secreenWidth * 0.03), // مسافة بين الأيقونة والنص
                      Text(
                        controller.selectedLanguage,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: secreenWidth * 0.06,
                        ),
                      ),
                      SizedBox(
                          width: secreenWidth * 0.45), // مسافة بين النص والسهم
                      Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                          size: secreenWidth * 0.1), // سهم للأسفل
                    ],
                  ),
                ),
              ),
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
