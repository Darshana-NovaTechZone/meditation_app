import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../color/colors.dart';
import 'custom_text.dart';

class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton(
      {super.key,
      required this.text,
      required this.w,
      required this.onTap,
      required this.icon});
  final String text;
  final double w;
  final VoidCallback onTap;
  final String icon;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
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
          child: SizedBox(
            width: w / 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Image.asset(widget.icon)),
                CustomText(
                    text: widget.text,
                    fontSize: 15.sp,
                    color: mwhite,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
