import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../color/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.w});
  final String text;
  final double w;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: h / 15,
      width: w,
      decoration:
          BoxDecoration(color: malloy, borderRadius: BorderRadius.circular(10)),
      child: CustomText(
          text: text,
          fontSize: 15.sp,
          color: mwhite,
          fontWeight: FontWeight.bold),
    );
  }
}
