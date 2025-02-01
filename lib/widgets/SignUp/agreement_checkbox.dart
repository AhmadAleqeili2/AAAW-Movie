import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/names.dart';
import 'package:easy_localization/easy_localization.dart';

/// [AgreementCheckbox] Widget for the agreement checkbox
class AgreementCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  AgreementCheckbox({required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (!isChecked) {
              return primarycolor;
            } else {
              return const Color.fromARGB(
                  255, 48, 47, 47); // اللون عند عدم التحديد
            }
          }),
          checkColor: Colors.red,
          value: isChecked,
          onChanged: onChanged,
        ),
        RichText(
          textAlign: TextAlign.center, // توسيط النص داخل RichText
          text: TextSpan(
            style: const TextStyle(
                color: Colors.white, fontSize: 10), // النص الافتراضي
            children: <TextSpan>[
              TextSpan(
                  text: ConstantNames.aggrement
                      .tr() // جزء من النص العادي
                  ),
              TextSpan(
                text: ConstantNames.privacy
                    .tr(), // جزء من النص الذي سيكون زر
                style: const TextStyle(
                  color: Color(red),
                  fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // يمكنك إضافة هنا حدث عند الضغط على الزر
                  },
              ),
              TextSpan(
                text: ConstantNames.and.tr(), // جزء من النص العادي
              ),
              TextSpan(
                text: ConstantNames.terms
                    .tr(), // جزء من النص الذي سيكون زر
                style: const TextStyle(
                  color: Color(red),
                  fontWeight: FontWeight.bold, // تخصيص مظهر الزر
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // يمكنك إضافة هنا حدث عند الضغط على الزر
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
