import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/view/login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextForm Controller
  TextEditingController emailController = TextEditingController();
  UserController controller = UserController();
  // Form Validation

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
              TextFormField(
                controller: emailController,
                decoration:
                    InputDecoration(labelText: ConstantNames.email.tr()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ConstantNames.enterYourEmail.tr();
                  }
                  return null;
                },
                onSaved: (value) => emailController.text = value!,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => controller.validateAndSubmit(
                    emailController.value.text, context, _formKey),
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.red)),
                child: Text(ConstantNames.submit.tr()),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: GestureDetector(
                  onTap: () => controller.navigateToSignIn(context),
                  child: RichText(
                    text: TextSpan(
                      text: ConstantNames.haveAccount.tr(),
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: ConstantNames.signIn.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 17, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
