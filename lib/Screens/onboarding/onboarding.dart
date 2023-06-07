import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/login/loging.dart';

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
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => IntroOne()),
        //   );
      },
    );
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
          right: 20,
          top: 20,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: white, fontFamily: 'Roboto', fontSize: 25),
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
                  height: h / 3.2,
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              CustomText(
                  text: 'WELCOME',
                  fontSize: 45,
                  color: mwhite,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: 'Do meditation. Stay focused \nLive a healthy life.',
                  fontSize: 25,
                  color: mwhite,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: h / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: CustomButton(
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
                            fontSize: 25,
                            color: mwhite,
                            fontWeight: FontWeight.normal),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: CustomText(
                                text: "Sign Up",
                                fontSize: 25,
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
