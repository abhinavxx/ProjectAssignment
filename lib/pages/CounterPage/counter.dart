import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

//used when value is increases
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//used when value is decreases
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          'Counter Assignment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Decremented part
            FlatButton(
              color: Colors.blue,
              onPressed: _decrementCounter,
              child: Icon(Icons.remove),
            ),

            //Text which is incremented or decremented
            Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: new Offset(1.0, 1.0))
                  ],
                ),
                child: Center(
                    child: Text('$_counter', style: TextStyle(fontSize: 50)))),

            //Incremented Part
            FlatButton(
              color: Colors.blue,
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
