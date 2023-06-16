import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/login/loging.dart';
import 'package:medi_app/Screens/login/signup/signup.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/background.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(color: white, fontSize: 15.sp),
                  ),
                )),
          ),
        ),
        Positioned(
          bottom: h / 10,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 10,
              ),
              Container(
                child: Image.asset(
                  'assets/l.png',
                  height: h / 3.5,
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              CustomText(
                  text: 'WELCOME',
                  fontSize: 20.sp,
                  color: mwhite,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: 'Do meditation. Stay focused \nLive a healthy life.',
                  fontSize: 13.sp,
                  color: mwhite,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: h / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          text: 'Login With Email',
                          w: w,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Don't have an account? ",
                            fontSize: 13.sp,
                            color: mwhite,
                            fontWeight: FontWeight.normal),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: CustomText(
                                text: "Sign Up",
                                fontSize: 13.sp,
                                color: mwhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
