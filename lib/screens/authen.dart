import 'package:flutter/material.dart';
import 'regster.dart';

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
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  Widget loginButton() {
    return RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      color: Colors.green[900],
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget registerButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'No Account :',
            style: TextStyle(color: Colors.pink),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.green[700],
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print('You Click Register');
              var goToRegisterRoute = MaterialPageRoute(
                  builder: (BuildContext context) => Register());
                  Navigator.of(context).push(goToRegisterRoute);
            },
          )
        ],
      ),
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
        padding: EdgeInsets.only(top: 60.0, left: 50.0, right: 50.0),
        alignment: Alignment(0, -1), //นี่คือการเรียงใน Container
        child: Column(
          children: <Widget>[
            showLogo(),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: showAppName(),
            ),
            Container(
              child: userTextFormField(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: passwordTextFormField(),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Expanded(
                    child: loginButton(),
                  ),
                ),
              ],
            ),
            registerButton(context)
          ],
        ),
      ),
    );
  }
}
