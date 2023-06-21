import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../widget/custom_text.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
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
              MaterialPageRoute(builder: (context) => Onboarding2()),
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
                      text: 'Find peace and\nmindfulness',
                      fontSize: 20.sp,
                      color: mwhite,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                      height: h / 2.2,
                      child: Lottie.asset(
                          'assets/47141-4-7-8-breathing-technique.json')),
                  SizedBox(
                    height: h / 10,
                  ),
                  CustomText(
                      text:
                          'Reduce stress, achieve balance,\n and enhance well-being.',
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
