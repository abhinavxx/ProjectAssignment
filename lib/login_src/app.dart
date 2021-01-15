import 'package:flutter/material.dart';
import 'package:practice/login_src/screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
