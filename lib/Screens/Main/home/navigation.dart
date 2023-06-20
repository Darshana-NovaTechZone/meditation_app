import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_app/Screens/Main/home/home.dart';
import 'package:medi_app/Screens/profile/profile.dart';
import 'package:medi_app/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../../color/colors.dart';
import '../../../widget/Custom_drawer.dart';
import '../../images/images.dart';
import '../../lets_meditation/lets_meditation.dart';
import '../../sound/sound.dart';
import '../../tool/tool.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool iconSize1 = false;
  bool iconSize2 = false;
  bool iconSize3 = false;
  bool proImg = false;

  static List<Widget> _pages = <Widget>[
    Home(),
    LetsMeditate(),
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
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: customDrawer(),
        backgroundColor: mblack,
        bottomNavigationBar: ClipRRect(
          child: Container(
            child: BottomNavigationBar(
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              unselectedIconTheme: IconThemeData(size: 15.sp, color: malloy),
              unselectedItemColor: Colors.deepOrangeAccent,
              selectedIconTheme: IconThemeData(color: white, size: 19.sp),
              selectedItemColor: white,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: mblack,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.baby_changing_station),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_filter),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: h / 8,
                      width: w,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: h / 12,
                      color: Color.fromARGB(255, 67, 65, 65),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () =>
                                  _scaffoldKey.currentState!.openDrawer(),
                              child: Icon(
                                Icons.circle_outlined,
                                size: h / 17,
                                color: litewhie,
                              ),
                            ),
                            Container(
                              width: w / 7,
                              child: CircleAvatar(
                                radius: h / 40,
                                child: Image.asset(
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
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: h / 17,
                        backgroundColor: Color.fromARGB(174, 77, 76, 76),
                        child: Image.asset(
                          'assets/l.png',
                          height: h / 11,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: _pages.elementAt(_selectedIndex), //New
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
