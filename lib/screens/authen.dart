import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showAppName() {
    return Text(
      'Ung Food Shop',
      style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.green[900]),
    );
  }

  Widget userTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'User :',
          hintText: 'Fill Your User Here',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'More 6 Charactor', labelStyle: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.brown[900], Colors.brown[100]],
                begin: Alignment(1, -1))),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment(0, -1), //นี่คือการเรียงใน Container
        child: Column(
          children: <Widget>[
            showLogo(),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: showAppName(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: userTextFormField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: passwordTextFormField(),
            )
          ],
        ),
      ),
    );
  }
}
