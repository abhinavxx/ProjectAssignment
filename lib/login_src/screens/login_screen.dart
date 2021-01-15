import 'package:flutter/material.dart';
import 'package:practice/login_src/blocs/bloc.dart';
import 'package:practice/login_src/blocs/provider.dart';
import 'package:practice/pages/mainUI/centralUI.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            emailField(bloc),
            passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 25),
            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'yourexample@gmail.com',
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          keyboardType: TextInputType.phone,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (snapshot.hasData) {
                bloc.submit();
                print("ho ya");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainControl()));
              } else {
                return null;
              }
            });
      },
    );
  }
}
