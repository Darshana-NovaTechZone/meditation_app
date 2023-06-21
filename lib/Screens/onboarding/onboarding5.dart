import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medi_app/Screens/login/loging.dart';
import 'package:medi_app/Screens/login/signup/signup.dart';
import 'package:medi_app/widget/login_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../color/colors.dart';
import '../../helper/google_signin_helper.dart';
import '../../providers/google_sign_provider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../Main/home/navigation.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationScreen()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: white, fontSize: 15.sp),
                  ),
                )),
          ),
        ),
        Positioned(
          bottom: h / 18,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 10,
              ),
              Container(
                child: Image.asset(
                  'assets/l.png',
                  height: h / 3.5,
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              CustomText(
                  text: 'WELCOME',
                  fontSize: 20.sp,
                  color: mwhite,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 20,
              ),
              CustomText(
                  text: 'Do meditation. Stay focused \nLive a healthy life.',
                  fontSize: 13.sp,
                  color: mwhite,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: h / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomLoginButton(
                        icon: "assets/icons8-gmail-login-48.png",
                        onTap: () {
                          // signInWithGoogle(context: context);
                        },
                        text: 'Login With Email',
                        w: w,
                      ),
                    ),
                    SizedBox(
                      height: h / 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomLoginButton(
                        icon: "assets/icons8-google-48.png",
                        onTap: () {
                          signInWithGoogle(context: context);

                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin().whenComplete(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GmailLogin()));
                            print(FirebaseAuth.instance.currentUser);
                          });
                          // signInWithGoogle(context: context);
                        },
                        text: 'Login With Gmail',
                        w: w,
                      ),
                    ),
                    SizedBox(
                      height: h / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Don't have an account? ",
                            fontSize: 13.sp,
                            color: mwhite,
                            fontWeight: FontWeight.normal),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: CustomText(
                                text: "Sign Up",
                                fontSize: 13.sp,
                                color: mwhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Future<User?> signInWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    print(user);
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      log(userCredential.toString());
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // handle the error here
      } else if (e.code == 'invalid-credential') {
        // handle the error here
      }
    } catch (e) {
      // handle the error here
    }
  }

  return user;
}
