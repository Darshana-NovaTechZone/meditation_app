import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

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
                  text: "Need to Contact Us?",
                  fontSize: 23.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: h / 2.6,
                    child: Lottie.asset('assets/76038-contact-mail.json')),
                CustomText(
                  color: white,
                  text:
                      "Contact our support officers.they are ready to assist you.",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: h / 40,
                ),
                Container(
                  width: w / 1.35,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                          height: h / 23,
                          child: Image.asset('assets/sms_ico.png')),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'support@novatechzone.com',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Merienda",
                            color: malloy,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                SizedBox(
                  height: h / 40,
                ),
                Container(
                  width: w / 1.35,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                          height: h / 23,
                          child: Image.asset('assets/web.png')),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'www.novatechzone.lk',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Merienda",
                            color: malloy,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                SizedBox(
                  height: h / 30,
                ),
                Container(
                  alignment: Alignment.center,
                  height: h / 15,
                  width: w / 1.4,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                            height: h / 23,
                            child: Image.asset('assets/insta.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                            height: h / 23,
                            child: Image.asset('assets/youtube.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                            height: h / 23,
                            child: Image.asset('assets/fb.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                            height: h / 23,
                            child: Image.asset('assets/twitter.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                            height: h / 23,
                            child: Image.asset('assets/pinterest.png')),
                      ),
                    
                    ],
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: "Copyright @ 2023 by\nBrilliant Minds Meditation",
                      fontSize: 9.sp,
                      color: white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   alignment: Alignment.center,
                //   child: CustomText(
                //       text: "Powered by NovaTechZone (Pvt) Ltd",
                //       fontSize: 14,
                //       fontFamily: "Viga-Regular",
                //       color: Color.fromARGB(255, 20, 50, 223),
                //       fontWeight: FontWeight.bold),
                // ),
              ]),
            )));
  }
}
