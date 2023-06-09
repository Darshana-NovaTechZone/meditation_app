import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: h / 30,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: white,
                size: 30,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 30,
              ),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Meditation  ",
                  fontSize: 23.sp,
                  color: white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                    text:
                        "Guided by a short introductory course,\nstart trying meditation.",
                    fontSize: 13.sp,
                    color: litewhie,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: h / 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/ed.PNG',
                  fit: BoxFit.fill,
                  height: h / 3.5,
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: "45:00  ",
                  fontSize: 23.sp,
                  color: white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w / 4),
                child: CustomButton(text: "Start Now", w: w),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
