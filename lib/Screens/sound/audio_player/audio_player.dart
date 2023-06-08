import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';

import 'package:medi_app/color/colors.dart';
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
    player.onPlayerComplete.listen((event) {
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

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mblack,
      body: Container(
        height: h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: h / 5,
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: h / 6,
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
              fontSize: 20.sp,
              color: litewhie,
              fontWeight: FontWeight.normal),
          PolygonWaveform(
            inactiveColor: white,
            activeColor: brown,
            samples: [],
            height: 100,
            width: 300,
            // maxDuration: duration,
            // elapsedDuration: Position,
          ),
          SizedBox(
            height: h / 20,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.restart_alt_outlined,
                        color: white,
                        size: 30,
                      )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        onPressed: () {
                          player.setPlaybackRate(1.5);
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
                          await player.play(UrlSource(
                            'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3',
                          ));
                        }
                      },
                      child: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: white,
                        size: 70,
                      )),
                  TextButton(
                      onPressed: () {
                        player.setPlaybackRate(0.5);
                      },
                      child: Icon(
                        Icons.fast_forward_rounded,
                        color: white,
                        size: 30,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.repeat_rounded,
                        color: white,
                        size: 30,
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
