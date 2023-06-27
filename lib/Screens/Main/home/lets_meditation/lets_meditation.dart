import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/Screens/Main/home/lets_meditation/meditate_details.dart/meditate_detail.dart';
import 'package:sizer/sizer.dart';

import '../../../../color/colors.dart';
import '../../../../widget/custom_text.dart';

class LetsMeditate extends StatefulWidget {
  const LetsMeditate({super.key});

  @override
  State<LetsMeditate> createState() => _LetsMeditateState();
}

class _LetsMeditateState extends State<LetsMeditate> {
  bool tap = false;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    ScrollController scroll = ScrollController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SingleChildScrollView(
        controller: scroll,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: h / 10,
            ),
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
            SizedBox(
              height: h / 40,
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
              height: h / 50,
            ),
            ListView.builder(
              padding: EdgeInsets.only(bottom: 200),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  color: mblack,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MeditateDetail()),
                      );
                    },
                    onTapCancel: () {
                      setState(() {
                        selected = index;
                        tap = false;
                      });
                    },
                    onTapDown: (_) {
                      setState(() {
                        selected = index;
                        tap = true;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        selected = index;
                        tap = false;
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: tap && selected == index ? 0.2 : 1,
                      duration: Duration(milliseconds: 50),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7, top: 7),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: CustomText(
                                  color: black,
                                  text: "Mindfulness meditation",
                                  fontSize: 16.sp,
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
                              color: white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
