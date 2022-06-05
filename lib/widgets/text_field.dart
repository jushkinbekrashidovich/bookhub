import 'package:bookhubuz/core/constants.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isMultipleLine;
  final String defaultText;
  void Function(String) onChanged;
  TextInputType? textInputType;

  CustomTextField(
      {required this.hint,
      required this.onChanged,
      this.isMultipleLine = false,
      this.defaultText = "",
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            hint,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          //Type TextField
          width: double.infinity,
          height: isMultipleLine ? 120 : 60,
          alignment: isMultipleLine ? Alignment.topLeft : Alignment.centerLeft,
          decoration: BoxDecoration(
            color: black4,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: textInputType,
            maxLines: isMultipleLine ? 6 : 1,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: defaultText,
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
