import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/constant/colors.dart';

// [PrivacyTermsText] Widget for privacy and terms text
class PrivacyTermsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 10),
            children: <TextSpan>[
              TextSpan(text: ConstantNames.governedAccount.tr()),
              TextSpan(
                text: ConstantNames.privacy.tr(),
                style: const TextStyle(color: Color(red), fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {
                  // يمكنك إضافة هنا حدث عند الضغط على الزر
                },
              ),
              TextSpan(text: ConstantNames.and.tr()),
              TextSpan(
                text: ConstantNames.terms.tr(),
                style: const TextStyle(color: Color(red), fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {
                  // يمكنك إضافة هنا حدث عند الضغط على الزر
                },
              ),
              TextSpan(text: ConstantNames.usingThisApp.tr(), style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
