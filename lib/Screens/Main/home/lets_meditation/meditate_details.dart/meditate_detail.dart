import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/color/colors.dart';

import 'package:sizer/sizer.dart';

import '../../../../../widget/custom_text.dart';

class MeditateDetail extends StatefulWidget {
  const MeditateDetail({super.key});

  @override
  State<MeditateDetail> createState() => _MeditateDetailState();
}

class _MeditateDetailState extends State<MeditateDetail> {
  bool tap = false;
  bool tapButton = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: mblack,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    onTapDown: (_) {
                      setState(() {
                        tapButton = true;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        tapButton = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        tapButton = false;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 50),
                      opacity: tapButton ? 0.3 : 1,
                      child: CircleAvatar(
                          backgroundColor: white.withOpacity(0.3),
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: white,
                          )),
                    )),
              ),
            ),
            CustomText(
              color: white,
              text: "Mindfulness Meditation",
              fontSize: 23.sp,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      // assign the color to the border color
                      color: Color(0xffF7F3F0),
                      width: 0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 30, left: 5, right: 5),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_up_outlined,
                              color: white,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h / 60,
                            ),
                            Text(
                              "Instructions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: litewhie,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: h / 60,
                            ),
                            CustomText(
                              color: litewhie,
                              text:
                                  "This is how you are going to do this.First take a deep breath.Then exhale that breath.This is how you are going to do this.First take ",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
                height: h / 3,
                child: Lottie.asset('assets/31936-the-6-loading-circles.json')),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                onTapCancel: () {
                  setState(() {
                    tap = false;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    tap = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    tap = false;
                  });
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 50),
                  opacity: tap ? 0.3 : 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: malloy,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 60,
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_outlined,
                          color: white,
                          size: 30.sp,
                        ),
                        Text(
                          "Start Now",
                          style: TextStyle(color: white, fontSize: 17.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }
}
