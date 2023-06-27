import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:just_audio/just_audio.dart';
import 'package:medi_app/Screens/sound/audio_player/audio_player.dart';

import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Sound extends StatefulWidget {
  const Sound({super.key});

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  String selected = 'All';
  List cat = ['a', 'b', 'c', "m", "v", "f"];
  final player = AudioPlayer();

  bool isPlaying = false;
  int x = 0;
  Duration duration = Duration.zero;
  Duration Position = Duration.zero;
  bool tap = false;
  bool tapButton = false;
  ScrollController scroll = ScrollController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  String playImg =
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
  @override
  void initState() {
    setState(() {
      isPlaying = player.playerState.playing;

      log(player.playerState.playing.toString());
    });

    // player.onPlayerStateChanged.listen((event) {
    //   setState(() {
    //     isPlaying = event == PlayerState.playing;
    //   });
    // });
    // player.onDurationChanged.listen((newDuration) {
    //   setState(() {
    //     isPlaying = true;
    //     duration = newDuration;
    //   });
    // });
    // player.onPositionChanged.listen((newPosition) {
    //   log("jbhbhbhbhb");
    //   setState(() {
    //     Position = newPosition;
    //   });
    // });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: mblack,
        appBar: AppBar(
          backgroundColor: Color(0xff394546),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  onTapDown: (_) {
                    setState(() {
                      tapButton = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      tapButton = false;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      tapButton = false;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 50),
                    opacity: tapButton ? 0.3 : 1,
                    child: CircleAvatar(
                        backgroundColor: white.withOpacity(0.3),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: white,
                        )),
                  )),
            ),
          ),
          title: Container(
            alignment: Alignment.centerRight,
            child: CustomText(
                text: "Calm your mind",
                fontSize: 13.sp,
                color: white,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: SingleChildScrollView(
          controller: scroll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            playImg,
                            fit: BoxFit.fill,
                            height: h / 3.5,
                            width: w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: h / 25, top: h / 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: "Relax Sounds",
                                  fontSize: 17.sp,
                                  color: white,
                                  fontWeight: FontWeight.normal),
                              SizedBox(height: h / 60),
                              Text(
                                  "Sometimes the most productive\nthing you can do is relax.",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: h / 60),
                              InkWell(
                                onTapDown: (_) {
                                  setState(() {
                                    tap = true;
                                  });
                                },
                                onTapUp: (_) {
                                  setState(() {
                                    tap = false;
                                  });
                                },
                                onTapCancel: () {
                                  setState(() {
                                    tap = false;
                                  });
                                },
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AudioPlay(),
                                      ));
                                },
                                child: AnimatedOpacity(
                                  duration: Duration(microseconds: 50),
                                  opacity: tap ? 0.2 : 1,
                                  child: Container(
                                    height: h / 17,
                                    width: w / 3,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text: "play now ",
                                            fontSize: 10.sp,
                                            color: black,
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
                                                final duration =
                                                    await player.setUrl(
                                                        // Load a URL
                                                        'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3');
                                                player.play();
                                                // await player.play(UrlSource(
                                                //   'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3',
                                                // ));
                                              }

                                              // final duration = await _player.setUrl(
                                              //     'http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3');
                                            },
                                            icon: Icon(isPlaying
                                                ? Icons.pause_circle
                                                : Icons.play_circle))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                      height: h / 3.5,
                      width: w,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AudioPlay()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: h / 12,
                                        height: h / 12,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: white),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              imgList[index],
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: 'dddd',
                                              fontSize: 15.sp,
                                              color: white,
                                              fontWeight: FontWeight.normal),
                                          CustomText(
                                              text: 'dddd',
                                              fontSize: 9.sp,
                                              color: litewhie,
                                              fontWeight: FontWeight.normal),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffF7F3F0).withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
