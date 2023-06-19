import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: mblack,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: CircleAvatar(
                      backgroundColor: white.withOpacity(0.3),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: white,
                      ))),
            ),
            CustomText(
              color: white,
              text: "About Us",
              fontSize: 23.sp,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              color: white,
              text: "Do meditation.Stay focused.\n Live a healthy life.",
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(
                child: Lottie.asset(
                    'assets/54102-sunrise-breathe-in-breathe-out.json')),
            CustomText(
              color: white,
              text:
                  "At Mediation, we believe in the transformative power of meditation. Our app is dedicated to helping you find inner peace, reduce stress,and cultivate mindfulness in your daily life. With a diverse library of guided meditations,soothing sounds, and mindfulness exercise,we provide the tools and support you need to embark on a journey of self-discovery and personal growth.Whether you're a beginner or an experienced practitioner,our app is here to inspire, guide, and empower you on your path to holistic well-being.Start your meditation journey with us today and experience the profound benefits of mindfulness in your life",
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomText(
                color: white,
                text: "Let's discover your hidden power together!",
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
