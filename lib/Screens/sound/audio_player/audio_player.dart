import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:medi_app/color/colors.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_text.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({super.key});

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration Position = Duration.zero;
  bool loop = false;
  void initState() {
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.PLAYING;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        isPlaying = true;
        duration = newDuration;
      });
    });
    player.onAudioPositionChanged.listen((newPosition) {
      log("jbhbhbhbhb");
      setState(() {
        Position = newPosition;
      });
    });
    player.onPlayerCompletion.listen((event) {
      setState(() {
        Position = Duration(seconds: 0);
        isPlaying = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  changeToSecond(int second) {
    Duration newDuration = Duration();
    setState(() {
      player.seek(newDuration);
    });
  }

  final List<Color> colors = [
    Colors.red[900]!,
    const Color.fromARGB(255, 149, 28, 183)!,
    brown,
    Colors.green[900]!,
    Color.fromARGB(255, 242, 154, 232)!,
    Colors.blue[900]!,
    red,
    Colors.brown[900]!
  ];
  @protected
  void dispose() {
    player.dispose();
    super.dispose();
  }

  final List<int> duration1 = [1000, 700, 600, 800, 500, 10, 100];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: mblack,
        body: Container(
          height: h,
          child: Stack(children: [
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
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: h / 8,
                      backgroundImage: ExactAssetImage(
                        'assets/4261159.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  CustomText(
                      text: "Relax Sounds",
                      fontSize: 20.sp,
                      color: white,
                      fontWeight: FontWeight.normal),
                  SizedBox(height: h / 60),
                  CustomText(
                      text: "By: Painting with passion",
                      fontSize: 17.sp,
                      color: litewhie,
                      fontWeight: FontWeight.normal),
                  SizedBox(
                    height: h / 15,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: w / 13),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 50,
                  //     child: Center(
                  //       child: WaveformProgressbar(
                  //         color: Colors.grey,
                  //         progressColor: white,
                  //         progress: Position.inSeconds.toDouble() / 60,
                  //         onTap: (progress) {
                  //           setState(() {
                  //             var tt = progress;
                  //             changeToSecond(tt.toInt());
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    child: MusicVisualizer(
                      curve: Curves.bounceIn,
                      barCount: 50,
                      colors: colors,
                      duration: duration1,
                    ),
                  ),
                  Slider(
                    value: Position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    activeColor: white,
                    inactiveColor: red,
                    min: 0.0,
                    onChanged: (value) {
                      log(value.toString());
                      setState(() {
                        changeToSecond(value.toInt());
                        value = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                player.release();
                              },
                              child: Icon(
                                Icons.restart_alt_outlined,
                                color: white,
                                size: 30,
                              )),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                                onPressed: () {
                                  player.setPlaybackRate(0.5);
                                },
                                icon: Icon(
                                  Icons.fast_rewind,
                                  color: white,
                                  size: 30,
                                )),
                          ),
                          TextButton(
                              onPressed: () async {
                                if (isPlaying) {
                                  log('dddddddddd');
                                  await player.stop();
                                } else {
                                  await player.play(
                                    'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3',
                                  );
                                }
                              },
                              child: Icon(
                                isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                color: white,
                                size: h / 9,
                              )),
                          TextButton(
                              onPressed: () {
                                player.setPlaybackRate(1.5);
                              },
                              child: Icon(
                                Icons.fast_forward_rounded,
                                color: white,
                                size: 30,
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  loop = !loop;
                                  print(loop.toString());
                                });
                                if (loop == true) {
                                  print(loop.toString());
                                  player.setReleaseMode(ReleaseMode.LOOP);
                                } else {
                                  print(loop.toString());
                                  player.setReleaseMode(ReleaseMode.STOP);
                                }
                              },
                              child: Icon(
                                Icons.repeat_rounded,
                                color: loop ? red : white,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
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
