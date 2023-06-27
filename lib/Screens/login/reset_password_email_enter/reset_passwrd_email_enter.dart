import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_text.dart';

class EmailEnter extends StatelessWidget {
  const EmailEnter({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: Column(children: [
        SizedBox(
          height: h / 20,
        ),
        Container(
          alignment: Alignment.center,
          child: CustomText(
              text: 'Forgot Password ?',
              fontSize: 16.sp,
              color: mwhite,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
            height: h / 2.2,
            child: Lottie.asset('assets/76038-contact-mail.json')),
        SizedBox(
          height: h / 18,
        ),
        CustomText(
            text:
                "Don't worry, type your email address\nand get instruction to reset your\npassword!",
            fontSize: 13.sp,
            color: Colors.white54,
            fontWeight: FontWeight.normal),
        SizedBox(
          height: h / 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white60,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white60,
                  ),
                ),
                hintText: '  Email Address',
                hintStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white60,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        SizedBox(
          height: h / 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onTap: () {},
            text: 'RESET PASSWORD',
            w: w,
          ),
        )
      ]),
    );
  }
}
