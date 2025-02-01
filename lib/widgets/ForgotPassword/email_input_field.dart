import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
/// [EmailInputField] Widget for entering email
class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  const EmailInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: ConstantNames.email.tr()),
      validator: (value) {
        if (value!.isEmpty) {
          return ConstantNames.enterYourEmail.tr();
        }
        return null;
      },
    );
  }
}


