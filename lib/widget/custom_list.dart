import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../color/colors.dart';
import 'custom_text.dart';

class CustomList extends StatefulWidget {
  const CustomList({super.key, required this.cat});
  final List cat;

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  String selected = 'All';

  @override
  void initState() {
    setState(() {
      String selected = 'All';
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool color = false;
    return Container(
      height: h / 6.5,
      child: ListView.builder(
          itemCount: widget.cat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
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
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: h / 12,
                        height: h / 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selected == widget.cat[index]
                                ? Colors.grey
                                : white),
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
                    CustomText(
                        text: 'dddd',
                        fontSize: 9.sp,
                        color: white,
                        fontWeight: FontWeight.normal)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
