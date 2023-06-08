import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  @override
  void initState() {
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        isPlaying = true;
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      log("jbhbhbhbhb");
      setState(() {
        Position = newPosition;
      });
    });

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
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/4261159.jpg',
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
                          Container(
                            height: h / 17,
                            width: w / 3,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "play now ",
                                    fontSize: 10.sp,
                                    color: black,
                                    fontWeight: FontWeight.bold),
                                IconButton(
                                    onPressed: () async {
                                      if (isPlaying) {
                                        log('dddddddddd');
                                        await player.stop();
                                      } else {
                                        await player.play(UrlSource(
                                          'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3',
                                        ));
                                      }

                                      // final duration = await _player.setUrl(
                                      //     'http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3');
                                    },
                                    icon: Icon(isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                  height: h / 3.5,
                  width: w,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: cat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AudioPlay()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Row(
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: white),
                                    child: Column(children: [
                                      SingleChildScrollView(
                                        child: CustomText(
                                            text: '',
                                            fontSize: 13.sp,
                                            color: white,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ]),
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
                            CustomText(
                                text: '20 min',
                                fontSize: 11.sp,
                                color: litewhie,
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
