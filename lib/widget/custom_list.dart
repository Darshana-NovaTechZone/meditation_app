import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    bool color = false;
    return Container(
      height: 160,
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
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: selected == widget.cat[index]
                                ? Colors.grey
                                : white),
                        child: Column(children: [
                          SingleChildScrollView(
                            child: CustomText(
                                text: '',
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.normal),
                          )
                        ]),
                      ),
                    ),
                    CustomText(
                        text: 'dddd',
                        fontSize: 13,
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
