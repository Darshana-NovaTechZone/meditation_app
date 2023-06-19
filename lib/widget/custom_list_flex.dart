import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../Screens/meditation/meditation.dart';
import '../color/colors.dart';
import 'custom_text.dart';

class CustomListFlex extends StatefulWidget {
  const CustomListFlex({super.key, required this.cat});
  final List cat;

  @override
  State<CustomListFlex> createState() => _CustomListFlexState();
}

class _CustomListFlexState extends State<CustomListFlex> {
  String selected = 'All';

  @override
  void initState() {
    setState(() {
      String selected = 'All';
    });
    // TODO: implement initState
    super.initState();
  }

  List cat = [
    'clam your self Track?',
    "sleep better",
    "sleep betteddr",
    "sleep betterd",
    "sleep betterdddddddddddd",
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool color = false;
    return Container(
      height: h / 8,
      child: ListView.builder(
          itemCount: cat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Meditation()),
                );
                setState(() {
                  selected = widget.cat[index];
                });
                if (selected == widget.cat[index]) {
                  log(selected);
                  setState(() {
                    color = true;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selected == widget.cat[index]
                              ? Colors.grey
                              : white),
                      child: Row(children: [
                        Icon(Icons.play_circle_outline),
                        CustomText(
                            text: cat[index],
                            fontSize: 11.sp,
                            color: black,
                            fontWeight: FontWeight.normal)
                      ]),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
