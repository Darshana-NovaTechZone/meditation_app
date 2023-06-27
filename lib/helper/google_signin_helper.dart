import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Screens/enter_name/enter_name.dart';
import '../Screens/login/loging.dart';

class GmailLogin extends StatefulWidget {
  const GmailLogin({Key? key}) : super(key: key);

  @override
  State<GmailLogin> createState() => _GmailLoginState();
}

class _GmailLoginState extends State<GmailLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('dddddddddddddddddddddddddddddddddddddd');
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white,
              size: 200,
            ),
          );
        } else if (snapshot.hasData) {
          Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white,
              size: 200,
            ),
          );

          print(FirebaseAuth.instance.currentUser!.phoneNumber);
          print(FirebaseAuth.instance.currentUser);
          print(snapshot.hasData);
          return EnterName();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white,
              size: 200,
            ),
          );
        }
      },
      // ),
    ));
  }
}
