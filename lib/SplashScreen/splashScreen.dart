import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice/login_src/app.dart';
import 'Cat_Animation/animation.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => App())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: LoginAnimation()),
        ),
      ),
    );
  }
}
