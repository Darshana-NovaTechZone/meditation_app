import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:medi_app/color/colors.dart';
import 'package:sizer/sizer.dart';

import '../../widget/chart.dart';
import '../../widget/custom_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mblack,
        body: Column(children: [
          SizedBox(
            height: h / 40,
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: h / 13,
              backgroundImage: ExactAssetImage(
                'assets/4261159.jpg',
              ),
            ),
          ),
          SizedBox(
            height: h / 40,
          ),
          CustomText(
              text: "Afreen Khan ",
              fontSize: 20.sp,
              color: white,
              fontWeight: FontWeight.normal),
          CustomText(
              text: "colombo,Sri Lanka \n",
              fontSize: 13.sp,
              color: litewhie,
              fontWeight: FontWeight.normal),
          TabBar(
            indicatorColor: mlightblue,
            indicatorWeight: 5,
            unselectedLabelColor: Colors.white30,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'STATS',
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('ACHIEVEMENTS',
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(
            height: h / 2,
            child: TabBarView(
              children: [
                BarChartSample2(),
                Icon(Icons.directions_transit, size: 350),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}