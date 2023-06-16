import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.fontWeight});
  final String text;
  final double fontSize;

  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color,
              fontFamily: "Merienda",
              fontSize: fontSize,
              fontWeight: fontWeight)),
    );
  }
}
