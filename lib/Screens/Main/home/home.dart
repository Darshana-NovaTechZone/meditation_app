import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:medi_app/Screens/meditation/meditation.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_list.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cat = ['a', 'b', 'c', "m", "v", "f"];
  final player = AudioPlayer();

  bool isPlaying = false;
  ScrollController scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scroll,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  text: 'Welcome back, Afreen!',
                  fontSize: 17.sp,
                  color: mwhite,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: h / 60,
              ),
              Text('How are you feeling today?',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white60,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: h / 40,
              ),
              CustomList(cat: cat),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: h / 60),
                          child: Column(
                            children: [
                              Container(
                                width: w,
                                height: h / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        right: 10,
                                        bottom: 10,
                                        child: Container(
                                          height: h / 7,
                                          child: Image.asset(
                                            'assets/p.PNG',
                                            //
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                                text: 'Meditation IOI',
                                                fontSize: 17.sp,
                                                color: black,
                                                fontWeight: FontWeight.normal),
                                            Text(
                                                "TechniQues,Bebefits,and\naBeginners's How-To",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            SizedBox(
                                              height: h / 80,
                                            ),
                                            Container(
                                              height: h / 18,
                                              width: w / 3,
                                              decoration: BoxDecoration(
                                                  color: mblack,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomText(
                                                      text: "watch now ",
                                                      fontSize: 10.sp,
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  IconButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          isPlaying =
                                                              !isPlaying;
                                                        });
                                                        if (isPlaying ==
                                                            false) {
                                                          log('dddddddddd');
                                                          await player.stop();
                                                        } else {
                                                          await player.setUrl(
                                                              // Load a URL
                                                              'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3');
                                                          player.play();
                                                        }
                                                      },
                                                      icon: Icon(
                                                        isPlaying
                                                            ? Icons.pause_circle
                                                            : Icons.play_circle,
                                                        color: white,
                                                      ))
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
