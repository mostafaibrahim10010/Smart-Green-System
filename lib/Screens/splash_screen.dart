import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sgs/Screens/Authentication%20Screens/auth_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sgs/Utils/Main_Variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const AuthPage())));
    return Scaffold(
        backgroundColor: HexColor(mainColor),
        body: const SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      width: 300,
                      height: 300,
                      child:
                          Image(image: AssetImage('assets/Others/Logo.jpg'))),
                )
              ],
            ),
          ),
        ));
  }
}
