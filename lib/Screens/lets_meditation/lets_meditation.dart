import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../widget/custom_text.dart';

class LetsMeditate extends StatelessWidget {
  const LetsMeditate({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scroll = ScrollController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SingleChildScrollView(
        controller: scroll,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            child: CustomText(
              color: white,
              text: "Let's Meditate",
              fontSize: 23.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
              height: h / 3,
              child: Lottie.asset('assets/81926-meditation.json')),
          Container(
            alignment: Alignment.center,
            child: CustomText(
              color: litewhie,
              text:
                  "Meditation can give you a sense of calm,peace and balance that can benifit bath your emotional well-being and your overall health.",
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: CustomText(
              color: white,
              text: "Now let's practice meditation",
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: h / 2,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: CustomText(
                            color: black,
                            text: "Mindfulness meditation",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: CustomText(
                            color: black,
                            text:
                                "Mindfulness meditation orgunate from buddist teaching and is the most populer and reseached from of meditation in the west",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    height: h / 5,
                    width: w,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(15)),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
