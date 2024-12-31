 import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WidgetDropDown extends StatefulWidget {
  const WidgetDropDown(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.title,
      required this.onChanged});
  final List<String> items;
  final String? selectedValue;
  final String title;
  final void Function(String?)? onChanged;
  @override
  State<WidgetDropDown> createState() => _WidgetDropDownState();
}

class _WidgetDropDownState extends State<WidgetDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (16*14).dg,
      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.list,
              size: 16.dg,
              color: Color.fromARGB(138, 217, 197, 179),
            ),
            SizedBox(
              width: 4.dg,
            ),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),

        // Handle null values for selectedValue
        value: widget.selectedValue != null &&
                widget.items.contains(widget.selectedValue)
            ? widget.selectedValue
            : null,

        onChanged: widget.onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50.h,
          width: 160.w,
          padding: const EdgeInsets.only(left: 14, right: 14).dg,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Color.fromARGB(255, 98, 129, 126),
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14.dg,
          iconEnabledColor: Color.fromARGB(138, 217, 197, 179),
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color:  Color.fromARGB(255, 98, 129, 126)
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40).dg,
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
          padding: const EdgeInsets.only(left: 14, right: 14).dg,
        ),
      )),
    );
  }
}