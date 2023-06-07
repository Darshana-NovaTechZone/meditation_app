import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_app/color/colors.dart';
import 'package:medi_app/widget/custom_list.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/burger-menu-svgrepo-com.svg',
                  color: white,
                  height: h / 13,
                ),
                SizedBox(
                  height: h / 13,
                  child: Image.asset(
                    'assets/l.png',
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  child: Image.asset(
                    'assets/User-Profile.png',
                    height: h / 13,
                  ),
                )
              ],
            ),
            SizedBox(
              height: h / 15,
            ),
            CustomText(
                text: 'Welcome back, Afreen!',
                fontSize: 35,
                color: mwhite,
                fontWeight: FontWeight.normal),
            SizedBox(
              height: 10,
            ),
            Text('How are you feeling today?',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white60,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              height: h / 30,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: w,
                                height: 200,
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
    );
  }
}
