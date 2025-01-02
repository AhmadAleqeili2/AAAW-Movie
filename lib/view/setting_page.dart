import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/utils/restart.dart';
import 'package:just_movie/widgets/Buttons/custom_button.dart';
import 'package:path_provider/path_provider.dart';

import '../model/boxes.dart';
import '../model/user.dart';
import '../widgets/custom_text_fields.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String selectedLanguage = "English";
  bool isNameEDiting = false;
  File? _imageFile;
  User? user = UserController().getUser(Boxes.boxToken.keys.first);

  // Method to handle image selection
  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = pickedFile.name;

        // Save the file in the assets folder within the app directory
        final savedImage =
            await File(pickedFile.path).copy('${appDir.path}/$fileName');
        user?.setImage('${appDir.path}/$fileName');
        setState(() {
          _imageFile = savedImage;
        });
        print("Image saved at: ${savedImage.path}");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Show BottomSheet for image selection
  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext ctx) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose an option".tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Camera".tr()),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _pickImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.photo),
                    label: Text("Gallery".tr()),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        onTap: () => _showImagePickerOptions(context),
                        child: user?.image != null
                            ? Image.asset(user?.image() ?? "")
                            : Icon(
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
                    isNameEDiting
                        ? CustomTextField(
                            fillColor: const Color(0xff222222),
                            hintText: 'username'.tr(),
                            width: secreenWidth * 0.85,
                            onSubmitted: (p0) {
                              user?.setFirstName(p0 ?? '');
                              UserController().changeUserInfo(user ?? User());
                              isNameEDiting = false;
                              setState(() {});
                            },
                          )
                        : Text(
                            user?.firstName() ?? 'Guest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    Text(
                      user?.email() ?? 'guest@example.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    isNameEDiting = !isNameEDiting;
                    setState(() {});
                  },
                  icon: Icon(Icons.edit),
                  alignment: Alignment.bottomLeft,
                )
              ]),
              SizedBox(height: secreenheight * 0.04),
              GestureDetector(
                onTap: () {
                  _showLanguageMenu(context);
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
                        selectedLanguage,
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
                  buttonText: "Reset Password".tr(),
                  onTap: () {
                    // Show a dialog when the button is pressed
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Reset Password"),
                              content: CustomTextField(
                                fillColor: const Color(0xff222222),
                                hintText: 'Password',
                                width: secreenWidth * 0.85,
                                isPass: true,
                                obscureText: true,
                                controller: passController,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('cancel'.tr()),
                                ),
                                TextButton(
                                    onPressed: () {
                                      User? user = UserController()
                                          .getUser(Boxes.boxToken.keys.first);
                                      user?.setPass(passController.value.text);
                                      UserController()
                                          .changeUserInfo(user ?? User());
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok".tr()))
                              ]);
                        });
                  }),
              SizedBox(height: secreenheight * 0.04),
              CustomButton(
                backgroundColor: primarycolor,
                borderColor: Colors.white,
                buttonText: "Log out".tr(),
                onTap: () => UserController().logout(context),
              ),
              SizedBox(height: secreenheight * 0.25),
              CustomButton(
                buttonText: "Delete Account".tr(),
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

  void _showLanguageMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black, // لون خلفية القائمة
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  'English',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'English';
                    context.setLocale(Locale('En'));
                    utilsREstart.reDraw(context);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  'العربية',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'العربية';
                    context.setLocale(Locale('Ar'));
                    utilsREstart.reDraw(context);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
