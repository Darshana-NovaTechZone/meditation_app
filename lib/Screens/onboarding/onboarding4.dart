import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text.dart';
import 'onboarding5.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: h / 12,
        ),
        Container(
          alignment: Alignment.center,
          child: CustomText(
              text:
                  'Use the app daily to see\nyour transformation\nwithin next 30 days',
              fontSize: 20.sp,
              color: mwhite,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: h / 35,
        ),
        SizedBox(
            height: h / 1.9,
            child: Lottie.asset('assets/129832-relaxing-habits.json')),
        SizedBox(
          height: h / 10,
        ),
        CustomButton(
          text: "LET'S BEGIN",
          w: w / 1.2,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Onboarding()),
            );
          },
        )
      ]),
    );
  }
}
