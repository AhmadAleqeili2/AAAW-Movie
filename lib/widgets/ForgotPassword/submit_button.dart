import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/auth_controller.dart';
/// [SubmitButton] Button to submit email for password recovery
class SubmitButton extends StatelessWidget {
  final UserController controller;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  const SubmitButton({
    super.key,
    required this.controller,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          controller.validateAndSubmit(emailController.text, context, formKey),
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.red),
      ),
      child: Text(ConstantNames.submit.tr()),
    );
  }
}