import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/login/loging.dart';
import 'package:medi_app/color/colors.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SingleChildScrollView(
        child: Container(
          height: h,
          child: Stack(children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/Group 27.png',
                fit: BoxFit.fill,
                height: h / 4,
                width: w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 10,
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/l.png',
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  CustomText(
                      text: 'Sign Up',
                      fontSize: 30,
                      color: mwhite,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Sign up now for free and start\nmeditating, and explore Medic.',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white60,
                          fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: h / 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        hintText: '  Name',
                        hintStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        hintText: '  Email Address',
                        hintStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        hintText: '  Password',
                        hintStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            fontSize: 17,
                            color: litewhie,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: CustomButton(
                          text: 'SignUp',
                          w: w,
                        ),
                      ),
                      SizedBox(
                        height: h / 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Already have an account? ",
                              fontSize: 25,
                              color: mwhite,
                              fontWeight: FontWeight.normal),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                  text: "Sign In",
                                  fontSize: 25,
                                  color: mwhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
