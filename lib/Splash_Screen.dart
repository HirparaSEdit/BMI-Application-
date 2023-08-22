import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 10),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welecome to BMI Calculaor App",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            ),
             SizedBox(
               height: 400,
             ),
            Text(
              "Created By Anadi Hirpara (7226010782)",
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
