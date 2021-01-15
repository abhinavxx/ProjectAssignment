import 'package:flutter/material.dart';
import 'package:practice/pages/API_UI/get_api_ui.dart';
import 'package:practice/pages/API_UI/post_api_ui.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu_book_outlined,
            color: Colors.black,
          ),
          title: new Text(
            'API Assignment',
            style: TextStyle(color: Colors.black),
          ),
          //tabbar
          bottom: new PreferredSize(
            preferredSize: new Size(80.0, 80.0),
            child: new Container(
              child: new TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                tabs: [
                  new Container(
                    child: new Tab(
                      text: 'GET API',
                    ),
                  ),
                  new Container(
                    child: new Tab(text: 'POST API'),
                  ),
                ],
              ),
            ),
          ),
        ),

        //Two tab-bar above
        body: TabBarView(
          children: [GETapiUI(), PostapiUI()],
        ),
      ),
    );
  }
}
