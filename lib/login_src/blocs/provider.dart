import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  bool updateShouldNotify(_) => true;
  //use of 'of' keyword= Since every widget have there context here by using of we can take the children part to identify its relevant parent context
//usng static helps to not create instance always

  Provider({Key key, Widget child}) : super(key: key, child: child);
  static Bloc of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}
