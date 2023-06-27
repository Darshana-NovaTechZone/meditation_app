import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_app/Screens/Main/home/home.dart';
import 'package:medi_app/Screens/Main/home/profile/profile.dart';
import 'package:medi_app/widget/custom_text.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:sizer/sizer.dart';

import '../../../color/colors.dart';
import '../../../widget/Custom_drawer.dart';
import 'images/images.dart';
import 'lets_meditation/lets_meditation.dart';
import '../../sound/sound.dart';
import '../../tool/tool.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool iconSize1 = false;
  bool iconSize2 = false;
  bool iconSize3 = false;
  bool proImg = false;

  static List<Widget> _pages = <Widget>[
    LetsMeditate(),
    Home(),
    Images(),
    Tool(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    log('ffff');
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        setState(() {
          proImg = true;
        });
      } else {
        setState(() {
          proImg = false;
        });
      }
      log(_selectedIndex.toString());
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size(w, h / 10),
              child: Column(children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: h / 11,
                          width: w,
                          color: Colors.transparent,
                        ),
                        Container(
                          height: h / 15,
                          color: Color(0xff394546),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      _scaffoldKey.currentState!.openDrawer(),
                                  child: Icon(
                                    Icons.adjust,
                                    size: h / 20,
                                    color: litewhie,
                                  ),
                                ),
                                Container(
                                  width: w / 7,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff394546),
                                    radius: h / 40,
                                    child: _selectedIndex == 0
                                        ? Icon(
                                            Icons.notifications_none_sharp,
                                            size: h / 22,
                                            color: litewhie,
                                          )
                                        : Image.asset(
                                            'assets/User-Profile.png',
                                            height: h / 15,
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff394546),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              height: h / 11,
                              width: h / 11,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/l.png',
                                  height: h / 11,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ])),
          key: _scaffoldKey,
          drawer: customDrawer(),
          backgroundColor: mblack,
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: "home",

            labels: const ["home", "meditation", "image", "gallery", "profile"],

            icons: const [
              Icons.home,
              Icons.psychology_rounded,
              Icons.photo,
              Icons.file_copy_outlined,
              Icons.person,
            ],

            // optional badges, length must be same with labels

            badges: [
              // Default Motion Badge Widget
            ],

            tabSize: 50,

            tabBarHeight: 55,

            textStyle: TextStyle(
              fontSize: 5,
              color: Color(0xff3A4647),
              fontWeight: FontWeight.w500,
            ),

            tabIconColor: const Color.fromARGB(255, 93, 97, 101),

            tabIconSize: 28.0,

            tabIconSelectedSize: 26.0,

            tabSelectedColor: mblack,

            tabIconSelectedColor: Colors.white,

            tabBarColor: Color(0xff3A4647),

            onTabItemSelected: (int value) {
              setState(() {
                _tabController!.index = value;
                _selectedIndex = value;
                print(value);
              });
            },
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: h,
              child: TabBarView(
                physics:
                    NeverScrollableScrollPhysics(), // swipe navigation handling is not supported

                controller: _tabController,

                children: <Widget>[
                  Home(),
                  LetsMeditate(),
                  Images(),
                  Tool(),
                  Profile(),
                ],
              ),
            ),
          )),
    );
  }
}
