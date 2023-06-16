import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_button.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../widget/custom_text.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  final CountdownController timer = new CountdownController(autoStart: false);
  TextEditingController _controller = TextEditingController();
  int? second;
  bool edit = false;
  bool timerStart = false;
  @override
  void initState() {
    second = 0;
    timer.setOnStart(() {
      print('ggggggggggggggggggggggggg');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: h / 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                  size: 30,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h / 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Meditation  ",
                    fontSize: 23.sp,
                    color: white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: h / 60,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CustomText(
                      text:
                          "Guided by a short introductory course,\nstart trying meditation.",
                      fontSize: 13.sp,
                      color: litewhie,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: h / 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/ed.PNG',
                    fit: BoxFit.fill,
                    height: h / 3.5,
                  ),
                ),
                SizedBox(
                  height: h / 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      edit = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Countdown(
                      controller: timer,
                      seconds: second!,
                      build: (BuildContext context, double time) => Container(
                        alignment: Alignment.center,
                        child: edit
                            ? Container(
                                width: 150,
                                alignment: Alignment.center,
                                child: TextField(
                                  onChanged: (value) async {
                                    setState(() {
                                      second = int.tryParse(_controller.text);
                                      print(second.toString());
                                    });
                                  },
                                  maxLength: 5,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 30.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "0.0",
                                    hintStyle: TextStyle(
                                      color: white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ),
                              )
                            : Text(
                                time.toString(),
                                style: TextStyle(
                                  color: white,
                                  fontSize: 30.sp,
                                ),
                              ),
                      ),
                      interval: Duration(milliseconds: 100),
                      onFinished: () {
                        print('Timer is done!');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w / 4),
                  child: CustomButton(
                    onTap: ()  async{
                         int? sec = await int.tryParse(_controller.text);
                    print("ssssssss" + second.toString());
                    setState(() {
                      second = sec;
                      log("ddddddddddd" + second.toString());
                      edit = false;
                      timerStart = !timerStart;

                      if (timerStart) {
                        timer.start();
                      } else {
                        timer.pause();
                      }
                    });
                    },
                      text: timerStart ? "Puse" : "Start Now", w: w),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
