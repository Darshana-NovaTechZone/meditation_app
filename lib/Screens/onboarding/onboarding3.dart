import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/Screens/onboarding/onboarding4.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../widget/custom_text.dart';
import 'onboarding5.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: malloy,
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Onboarding4()),
            );
          },
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/splash_screen_blur.jpg",
              height: h,
              width: w,
              fit: BoxFit.fill,
            ),
            Container(
              color: black.withOpacity(0.6),
              height: h,
              width: w,
              child: Column(
                children: [
                  SizedBox(
                    height: h / 12,
                  ),
                  CustomText(
                      text: 'Discover the power of\n meditation',
                      fontSize: 20.sp,
                      color: mwhite,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                      height: h / 2.2,
                      child: Lottie.asset('assets/107370-meditation.json')),
                  SizedBox(
                    height: h / 10,
                  ),
                  CustomText(
                      text:
                          'Start your practice today for\nself-discovery and personal\ngrowth',
                      fontSize: 16.sp,
                      color: mwhite,
                      fontWeight: FontWeight.normal),
                ],
              ),
            )
          ],
        ));
  }
}
