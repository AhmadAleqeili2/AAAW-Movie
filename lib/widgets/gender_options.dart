import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final TextEditingController controller;

  const GenderDropdown({
    super.key,
    required this.controller,
  });

  @override
  GenderDropdownState createState() => GenderDropdownState();
}

class GenderDropdownState extends State<GenderDropdown> {
  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth*0.102),
      decoration: BoxDecoration(
        color: Color(0xff222222), // لون خلفية المربع
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffC3C3C3)), // إطار خفيف
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.controller.text.isNotEmpty ? widget.controller.text : null,
          hint:  Text(
            "Gender".tr(),
            style: TextStyle(color: Colors.white), // لون النص داخل المربع
          ),
          dropdownColor: Colors.black, // لون القائمة عند الضغط
          items: ["MALE", "FEMALE"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.white), // لون النص في القائمة
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.controller.text = value ?? ""; // تحديث القيمة المختارة
            });
          },
        ),
      ),
    );
  }
}
