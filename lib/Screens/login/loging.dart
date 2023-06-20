

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/login/signup/signup.dart';
import 'package:medi_app/color/colors.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../Main/home/home.dart';
import '../Main/home/navigation.dart';
import 'reset_password/reset_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                'assets/Group 40.png',
                fit: BoxFit.fill,
                height: h / 3.5,
                width: w,
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Skip',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white54,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: h / 5,
                    child: Image.asset(
                      'assets/l.png',
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CustomText(
                        text: 'Sign In',
                        fontSize: 17.sp,
                        color: mwhite,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: CustomText(
                        color: Colors.white38,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        text:
                            'Sign in now to access your \nmeditations & daily exercises.',
                      )),
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()),
                        );
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: litewhie,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationScreen()),
                          );
                        },
                        text: 'LOGIN',
                        w: w,
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
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
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
