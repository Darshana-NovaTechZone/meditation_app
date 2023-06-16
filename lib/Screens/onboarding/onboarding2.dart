import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/Screens/onboarding/onboarding3.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../widget/custom_text.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
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
              MaterialPageRoute(builder: (context) => Onboarding3()),
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
                      text: 'Begin your journey to a\ncalm & a fulfilling life',
                      fontSize: 20.sp,
                      color: mwhite,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                      height: h / 2.2,
                      child: Lottie.asset('assets/107872-family-hug.json')),
                  SizedBox(
                    height: h / 10,
                  ),
                  CustomText(
                      text:
                          'guided meditations,breathing\nexercises.and soothing sounds\n await',
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
