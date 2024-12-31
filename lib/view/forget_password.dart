import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
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

  // Form Validation
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() {
    if (_validateAndSave()) {
      if (AuthController()
          .checkAccountValidation(emailController.value.text)) {
            ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("We sent message to your email")),
      );
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("This user does not exist")),
      );
          }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Forgot Password'),
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
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => emailController.text = value!,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _validateAndSubmit,
                style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.red)),
                child: const Text('Submit'),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: GestureDetector(
                  onTap: _navigateToSignIn,
                  child: RichText(
                    text: const TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
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

  // Goto SignUp Page
  void _navigateToSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
