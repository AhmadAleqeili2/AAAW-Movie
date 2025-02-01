import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/widgets/ForgotPassword/email_input_field.dart';
import 'package:just_movie/widgets/ForgotPassword/signIn_redirect.dart';
import 'package:just_movie/widgets/ForgotPassword/submit_button.dart';
/// [ForgotPassword] 
/// Password recovery page
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final UserController controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(ConstantNames.forgetPassword.tr()),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: primarycolor,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Widget for entering email
              EmailInputField(controller: emailController),
              const SizedBox(height: 16.0),
              //Button to submit email for password recovery
              SubmitButton(
                controller: controller,
                emailController: emailController,
                formKey: _formKey,
              ),
              const SizedBox(height: 16.0),
              //Redirects user to sign-in page
              SignInRedirect(controller: controller),
           
            ],
          ),
        ),
      ),
    );
  }
}



