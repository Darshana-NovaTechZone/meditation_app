

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/login/loging.dart';
import 'package:medi_app/Screens/login/reset_password/reset_password.dart';
import 'package:medi_app/color/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import 'verify_account/verify_account.dart';

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
                    height: h / 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CustomText(
                        text: 'Your New Account',
                        fontSize: 16.sp,
                        color: mwhite,
                        fontWeight: FontWeight.normal),
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
                        hintText: '  Name',
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
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
                            fontSize: 13.sp,
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
                            fontSize: 13.sp,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyAccount()),
                          );
                        },
                        text: 'SignUp',
                        w: w,
                      ),
                      SizedBox(
                        height: h / 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Already have an account? ",
                              fontSize: 13.sp,
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
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: mwhite,
                                      fontFamily: 'Merienda',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              )),
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
