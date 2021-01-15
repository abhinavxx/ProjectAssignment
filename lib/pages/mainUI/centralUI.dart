import 'package:flutter/material.dart';
import 'package:practice/pages/CounterPage/counter.dart';
import 'package:practice/pages/homepage/homepage.dart';

//for control of both bottom navigation bar
class MainControl extends StatefulWidget {
  @override
  _MainControlState createState() => _MainControlState();
}

class _MainControlState extends State<MainControl> {
  int currentIndex = 0;
  final tabs = [MyHomePage(), CounterPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
                  currentIndex = index;
                }),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                title: Text('Counter part'),
              )
            ]));
  }
}
