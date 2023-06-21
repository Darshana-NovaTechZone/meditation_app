import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          print('dddddddddddddddddddddddddddddddqqqqqqqqqqqdddddddddddddd');
          print(FirebaseAuth.instance.currentUser!.phoneNumber);
          print(FirebaseAuth.instance.currentUser);
          print(snapshot.hasData);
          return Login();
        } else if (snapshot.hasError) {
          print('ddddddddddddddddddddddddssssssssssssssssssssdddddddddddddd');
          return const Center(
            child: Text('Something went wrong'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      // ),
    ));
  }
}
