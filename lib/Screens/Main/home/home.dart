import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/Screens/meditation/meditation.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_list.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_list_flex.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/main_list.dart';
import '../../sound/sound.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List cat = ['a', 'b', 'c', "m", "v", "f"];
  final player = AudioPlayer();
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CustomText(
                text: 'Welcome back, Afreen!',
                fontSize: 17.sp,
                color: mwhite,
                fontWeight: FontWeight.normal),
            Text('How are you feeling today?',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white60,
                    fontWeight: FontWeight.normal)),
            SizedBox(
                height: h / 3,
                child: Lottie.asset('assets/43792-yoga-se-hi-hoga.json')),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cat.length >= 3 ? 3 : cat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sound(),
                            ));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5, vertical: h / 60),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                    BorderRadius.circular(10)),
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
                                                          : Icons
                                                              .play_circle_outlined,
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
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: "Most listened tracks ",
                  fontSize: 10.sp,
                  color: litewhie,
                  fontWeight: FontWeight.bold),
            ),
            CustomListFlex(
              cat: cat,
            ),
            MainList(),
            Container(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: "Latest tracks ",
                  fontSize: 10.sp,
                  color: litewhie,
                  fontWeight: FontWeight.bold),
            ),
            CustomListFlex(
              cat: cat,
            ),
            MainList(),
            SizedBox(
              height: 8,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              decoration: BoxDecoration(color: black),
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  String img = imgList.toString();
                  return Container(
                    child: Image.network(
                      imgList[index].toString(),
                      // i[index]['image_path'],
                      fit: BoxFit.scaleDown,
                    ),
                  );
                },
                options: CarouselOptions(
                    padEnds: false,
                    viewportFraction: 1,
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2000),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                itemCount: imgList.length,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList()),
            CustomText(
                text: "give it a try you may love these apps",
                fontSize: 10.sp,
                color: litewhie,
                fontWeight: FontWeight.bold),
            CustomList(cat: cat),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                height: 100,
                width: w,
                color: white,
              ),
            ),
            SizedBox(
              height: 150,
            )
          ]),
        ),
      ),
    );
  }
}
