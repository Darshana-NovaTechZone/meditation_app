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
import '../../sound/sound.dart';

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
    Sound(),
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

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: h / 11,
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
                  icon: Image.asset(
                    'assets/l.png',
                    fit: BoxFit.contain,
                    height: _selectedIndex == 0 ? 19.sp : 15.sp,
                    color: _selectedIndex == 0 ? white : malloy,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.media_bluetooth_on),
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
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: h / 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/burger-menu-svgrepo-com.svg',
                  color: white,
                  height: h / 13,
                  width: 80,
                ),
                SizedBox(
                  height: h / 13,
                  child: Image.asset(
                    'assets/l.png',
                  ),
                ),
                proImg
                    ? Container(
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                              text: "edit",
                              fontSize: 10.sp,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(
                        width: 80,
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
    );
  }
}
