import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

import '../color/colors.dart';
import 'custom_text.dart';

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List cat = ['a', 'b', 'c', "m", "v", "f"];
  final player = AudioPlayer();

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cat.length >= 2 ? 2 : cat.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: h / 60),
                child: Column(
                  children: [
                    Container(
                      width: w,
                      height: h / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      text: 'Section-A',
                                      fontSize: 17.sp,
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  Text(
                                      "Calm yourself and\nbecome the best version",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: black,
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(
                                    height: h / 80,
                                  ),
                                  Container(
                                    height: h / 18,
                                    width: w / 3,
                                    decoration: BoxDecoration(
                                        color: mblack,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: "watch now ",
                                            fontSize: 10.sp,
                                            color: white,
                                            fontWeight: FontWeight.bold),
                                        IconButton(
                                            onPressed: () async {
                                              setState(() {
                                                isPlaying = !isPlaying;
                                              });
                                              if (isPlaying == false) {
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
                                                  : Icons.play_circle_outlined,
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
    );
  }
}
