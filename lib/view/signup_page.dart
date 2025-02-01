import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/model/user.dart';
import 'package:just_movie/widgets/Core/custom_button.dart';
import 'package:just_movie/widgets/SignUp/logo.dart';
import 'package:just_movie/widgets/SignUp/name_fields.dart';
import 'package:just_movie/widgets/SignUp/age_gender_fields.dart';
import 'package:just_movie/widgets/SignUp/email_password_fields.dart';
import 'package:just_movie/widgets/SignUp/agreement_checkbox.dart';

TextEditingController genderController = TextEditingController();
bool isChecked = false;

/// [SignUpPage] Main sign-up page
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController conPassController = TextEditingController();
  final TextEditingController firstNAmeController = TextEditingController();
  final TextEditingController lassNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    User user = User();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Logo(), // Logo widget
              const SizedBox(height: 20),
              NameFields(
                firstNAmeController: firstNAmeController,
                lassNameController: lassNameController,
                screenWidth: screenWidth,
              ), // NameFields widget
              AgeGenderFields(
                ageController: ageController,
                genderController: genderController,
                screenWidth: screenWidth,
              ), // AgeGenderFields widget
              EmailPasswordFields(
                emailController: emailController,
                passController: passController,
                conPassController: conPassController,
                screenWidth: screenWidth,
              ), // EmailPasswordFields widget
              AgreementCheckbox(
                isChecked: isChecked,
                onChanged: (value) {
                  isChecked = value ?? false;
                  setState(() {});
                },
              ), // AgreementCheckbox widget
              const SizedBox(height: 20),
              CustomButton(
                  buttonText: ConstantNames.createAccount.tr(),
                  backgroundColor: const Color(rustRed),
                  height: 50,
                  borderColor: const Color(rustRed),
                  borderWidth: 2,
                  onTap: () {
                    user.setAge(int.parse(ageController.value.text));
                    user.setEmail(emailController.value.text);
                    user.setFirstName(firstNAmeController.value.text);
                    user.setLastName(lassNameController.value.text);
                    user.setGender(genderController.value.text);
                    user.setPass(passController.value.text);
                    print(user.email());
                    String passwordRegex =
                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_-])[A-Za-z\d@$!%*?&]{8,}$";

                    bool isValidPassword(String password) {
                      RegExp regex = RegExp(passwordRegex);
                      return regex.hasMatch(password);
                    }

                    if ((user.age() ?? 0) < 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.invalidAgeMessage.tr())),
                      );
                    } else if (!user.email().toString().contains('@') &&
                        !user.email().toString().contains('.')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.invalidEmailMessage.tr())),
                      );
                    } else if (user.firstName().toString().length < 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.invalidEmailMessage.tr())),
                      );
                    } else if (user.lastName().toString().length < 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.invalidEmailMessage.tr())),
                      );
                    } else if (user.gender().toString().length < 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.invalidEmailMessage.tr())),
                      );
                    } else if (!isValidPassword(user.password() ?? '')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                ConstantNames.invalidPasswordMessage.tr())),
                      );
                    } else if (user.password() !=
                        conPassController.value.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text(ConstantNames.confirmPasswordMessage.tr())),
                      );
                    } else if (isChecked == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ConstantNames.checkBoxMessage.tr())),
                      );
                    } else {
                      UserController().signUp(user, context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
