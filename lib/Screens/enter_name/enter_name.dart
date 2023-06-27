import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/Screens/Main/home/home.dart';
import 'package:medi_app/Screens/login/loging.dart';
import 'package:medi_app/color/colors.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import '../Main/home/navigation.dart';

class EnterName extends StatefulWidget {
  const EnterName({super.key});

  @override
  State<EnterName> createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
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
                        text: "What's your name?",
                        fontSize: 16.sp,
                        color: mwhite,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CustomText(
                        text: "We prefer using real names. it's a trust thing.",
                        fontSize: 16.sp,
                        color: litewhie,
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
                        hintText: '  Your name',
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 10,
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
                                builder: (context) => NavigationScreen()),
                          );
                        },
                        text: 'Continue',
                        w: w,
                      ),
                      SizedBox(
                        height: h / 40,
                      ),
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
