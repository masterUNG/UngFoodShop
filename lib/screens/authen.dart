import 'package:flutter/material.dart';
import 'regster.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/user_model.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Key
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Variable
  String user, password;

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
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Plase Fill User in Blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  bool checkSpace(String value) {
    if (value.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
          labelStyle: TextStyle(color: Colors.white)),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Please Fill Password';
        }
      },
      onSaved: (String value) {
        password = value;
      },
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
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('user = $user, password = $password');
          checkUserAndPassword();
        }
      },
    );
  }

  void checkUserAndPassword() async {
    String urlString =
        'https://www.androidthai.in.th/tid/getUserWhereUserMaster.php?isAdd=true&User=$user';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');

    if (result.toString() == 'null') {
      print('User False');
      showSnackBar('ไม่มี $user ใน ฐานข้อมูล ของเรา');
    } else {
      print('User True');
      for (var objJSON in result) {
        
          print('objJSON = $objJSON');
          var userModel = UserModel.fromJSON(objJSON);

          String truePassword = userModel.Password.toString();
          String name = userModel.Name.toString();

          print('pass = $password, truePass = $truePassword');

          if (password == truePassword) {
            showSnackBar('ยินดีต้อนรับ $name');
          } else {
            showSnackBar('กรุณาลองใหม่ ? รหัสผิด คะ');
          }

      }



    } // if
  }

  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green[900],
      content: Text(message),
      action: SnackBarAction(textColor: Colors.red,
        label: 'Close',onPressed: (){},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
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
        key: scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
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
        ));
  }
}
