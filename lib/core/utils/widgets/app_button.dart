import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
    required this.borderColor,
  }) : super(key: key);
  double width;
  double height;

  void Function()? onTap;
  Color color;
  Color textColor;
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(25.r),
          ),
          border: Border.all(
              width: 1, color: borderColor!, style: BorderStyle.solid),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: fontWeight),
        )),
      ),
    );
  }
}
