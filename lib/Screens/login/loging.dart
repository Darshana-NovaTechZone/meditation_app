import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medi_app/Screens/login/signup/signup.dart';
import 'package:medi_app/color/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../helper/google_signin_helper.dart';
import '../../providers/google_sign_provider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

import '../../widget/login_button.dart';
import '../Main/home/navigation.dart';
import 'reset_password/reset_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mblack,
      body: SingleChildScrollView(
        child: Container(
          height: h,
          child: Stack(children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/Group 40.png',
                fit: BoxFit.fill,
                height: h / 3.5,
                width: w,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationScreen()),
                    );
                  },
                  child: Text('Skip',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: h / 5,
                    child: Image.asset(
                      'assets/l.png',
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CustomText(
                        text: 'Sign In',
                        fontSize: 17.sp,
                        color: mwhite,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: CustomText(
                        color: Colors.white38,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        text:
                            'Sign in now to access your \nmeditations & daily exercises.',
                      )),
                  SizedBox(
                    height: h / 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        hintText: '  Email Address',
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),
                        hintText: '  Password',
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white60,
                            fontWeight: FontWeight.normal)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()),
                        );
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: litewhie,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationScreen()),
                          );
                        },
                        text: 'LOGIN',
                        w: w,
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
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
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
                      ),
                      CustomLoginButton(
                        icon: "assets/icons8-google-48.png",
                        onTap: () {
                          Center(
                            child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.white,
                              size: 200,
                            ),
                          );
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
                        text: 'Sign In with Google',
                        w: w,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
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
