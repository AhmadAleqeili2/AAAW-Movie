// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  bool obscureText;
  final bool isPass;
  final TextEditingController? controller;
  final double width;
  final double height;
  final Color fillColor;
  final double fontSize;
  final TextAlign textAlign;
  final Color bordercolor;
  final Color hintTextColor; // معلمة جديدة لتخصيص لون نص الـ hintText
  final TextInputType? keyboard;
     String? Function(String?)? validator;

  void Function(String?)? onSubmitted;
  CustomTextField(
      {super.key,
      this.hintText = '',
      this.obscureText = false,
      this.width = double.infinity,
      this.height = 50.0,
      this.fillColor = Colors.white,
      this.fontSize = 16.0,
      this.textAlign = TextAlign.start,
      this.bordercolor = const Color(silver),
      this.hintTextColor =
          const Color(white), // القيمة الافتراضية للون النص
      this.isPass = false,
      this.controller,
      this.validator,
      this.keyboard,
      this.onSubmitted});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        keyboardType: widget.keyboard,
        controller: widget.controller,
        obscureText: widget.isPass ? widget.obscureText : false,
        textAlign: widget.textAlign,
        validator: widget.validator,
        style: TextStyle(fontSize: widget.fontSize, color: Colors.white),
        decoration: InputDecoration(
          
            hintText: widget.hintText,
            hintStyle:
                TextStyle(color: widget.hintTextColor), // تخصيص لون النص هنا
            filled: true,
            fillColor: widget.fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.bordercolor, width: 1),
              
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.bordercolor, width: 1),

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            suffixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      widget.obscureText = !widget.obscureText;
                      setState(() {});
                    },
                    icon: widget.obscureText
                        ? Icon(
                            CupertinoIcons.eye,
                            color: Colors.white,
                          )
                        : Icon(
                            CupertinoIcons.eye_slash,
                            color: Colors.white,
                          ))
                : null),
        onSaved: widget.onSubmitted,
        
      ),
    );
  }
}
