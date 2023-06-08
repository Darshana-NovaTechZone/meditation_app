import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_list.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cat = ['a', 'b', 'c', "m", "v", "f"];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  text: 'Welcome back, Afreen!',
                  fontSize: 17.sp,
                  color: mwhite,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: h / 60,
              ),
              Text('How are you feeling today?',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white60,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: h / 40,
              ),
              CustomList(cat: cat),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: cat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: h / 60),
                          child: Column(
                            children: [
                              Container(
                                width: w,
                                height: h / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: white),
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
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
