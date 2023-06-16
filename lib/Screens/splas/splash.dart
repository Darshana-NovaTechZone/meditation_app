import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../onboarding/onboarding5.dart';
import '../onboarding/onboarding1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Onboarding1()),
        );
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/background.jpg',
          height: h,
          width: w,
          fit: BoxFit.fill,
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/Logo.png',
            height: h / 1.8,
            // fit: BoxFit.fill,
          ),
        ),
      ]),
    );
  }
}
