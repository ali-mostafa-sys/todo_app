import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
