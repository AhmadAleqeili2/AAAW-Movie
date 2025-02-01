import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/model/boxes.dart';
import 'package:just_movie/model/user.dart';
import 'package:just_movie/utils/restart.dart';
import 'package:just_movie/widgets/Core/custom_text_fields.dart';
import 'package:path_provider/path_provider.dart';

class SettingController extends ChangeNotifier {
  File? _imageFile;
  User? user = UserController().getUser(Boxes.boxToken.keys.first);
  String selectedLanguage = "English";
  bool isNameEDiting = false;

  // Method to handle image selection
  Future<void> pickImage(ImageSource source) async {
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
        _imageFile = savedImage;
        print("Image saved at: ${savedImage.path}");
        notifyListeners();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Show BottomSheet for image selection
  void showImagePickerOptions(BuildContext context) {
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
                ConstantNames.chooseOption.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera),
                    label: Text(ConstantNames.camera.tr()),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      pickImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.photo),
                    label: Text(ConstantNames.gallery.tr()),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void resetPassword(BuildContext context,TextEditingController passController) {
    // Show a dialog when the button is pressed
    
    double secreenheight = MediaQuery.of(context).size.height;
    double secreenWidth = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(ConstantNames.resetPassword),
              content: CustomTextField(
                fillColor: const Color(darkGrey),
                hintText: ConstantNames.password,
                width: secreenWidth * 0.85,
                isPass: true,
                obscureText: true,
                controller: passController,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(ConstantNames.cancel.tr()),
                ),
                TextButton(
                    onPressed: () {
                      User? user =
                          UserController().getUser(Boxes.boxToken.keys.first);
                      user?.setPass(passController.value.text);
                      UserController().changeUserInfo(user ?? User());
                      Navigator.pop(context);
                    },
                    child: Text(ConstantNames.ok.tr()))
              ]);
        });
  }

  void showLanguageMenu(BuildContext context) {
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
                  selectedLanguage = 'English';
                  context.setLocale(Locale('en'));
                  utilsREstart.reDraw(context);
                  notifyListeners();
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
                  selectedLanguage = 'العربية';
                  context.setLocale(Locale('ar'));
                  utilsREstart.reDraw(context);
                  notifyListeners();
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
