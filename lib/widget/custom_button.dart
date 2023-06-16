import 'package:flutter/material.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';
import 'package:sizer/sizer.dart';

import '../color/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key, required this.text, required this.w, required this.onTap});
  final String text;
  final double w;
  final VoidCallback onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onTapCancel: () {
        setState(() {
          tap = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 50),
        opacity: tap ? 0.3 : 0.9,
        child: Container(
          alignment: Alignment.center,
          height: h / 15,
          width: widget.w,
          decoration: BoxDecoration(
              color: malloy, borderRadius: BorderRadius.circular(10)),
          child: CustomText(
              text: widget.text,
              fontSize: 15.sp,
              color: mwhite,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
