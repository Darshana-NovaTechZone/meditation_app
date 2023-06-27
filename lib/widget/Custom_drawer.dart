import 'package:flutter/material.dart';
import 'package:medi_app/Screens/about_us/about_us.dart';
import 'package:medi_app/Screens/send_suggestion/send_suggestion.dart';

import 'package:sizer/sizer.dart';

import '../Screens/contact_us/contact_us.dart';
import '../color/colors.dart';
import 'custom_text.dart';

class customDrawer extends StatefulWidget {
  const customDrawer({super.key});

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: Drawer(
        backgroundColor: mblack,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SizedBox(
          height: h,
          width: w / 1,
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    // Important: Remove any padding from the ListView.

                    children: [
                      SizedBox(
                        height: h / 20,
                      ),
                      Image.asset(
                        'assets/l.png',
                        height: h / 7,
                      ),
                      SizedBox(
                        height: h / 15,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.home_outlined,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "Home",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendSuggestion()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "Send Suggestions",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        focusColor: white,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => AboutUs()),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "Share With Friends",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ContactUs()),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "Rate Our App",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutUs()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "About Us",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUs()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add_call,
                                color: malloy,
                              ),
                              SizedBox(
                                width: w / 15,
                              ),
                              CustomText(
                                color: malloy,
                                text: "Contact Us",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.question_mark_sharp,
                              color: malloy,
                            ),
                            SizedBox(
                              width: w / 15,
                            ),
                            CustomText(
                              color: malloy,
                              text: "What is Meditation",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: malloy,
                            ),
                            SizedBox(
                              width: w / 15,
                            ),
                            CustomText(
                              color: malloy,
                              text: "Why I need Meditation",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: malloy,
                            ),
                            SizedBox(
                              width: w / 15,
                            ),
                            CustomText(
                              color: malloy,
                              text: "Logout",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 10,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text("Privarcy Policy",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: white,
                          fontFamily: "Merienda",
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                        )),
                    SizedBox(
                      height: h / 40,
                    ),
                    Text("Copyright 2023 by\nBrilliant Minds Meditation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Merienda",
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
