import 'package:flutter/material.dart';
import 'package:medi_app/color/colors.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../widget/custom_text.dart';

class Tool extends StatefulWidget {
  const Tool({super.key});

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: Column(children: [
        SizedBox(
          height: h,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: h / 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.book,
                              color: white,
                            ),
                            CustomText(
                              color: white,
                              text: "Mindfulness",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ]),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/pexels-rudolf-kirchner-831079.jpg',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color((math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                                  .withOpacity(0.2),
                              BlendMode.color)),
                      color: white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
