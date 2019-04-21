import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String name, user, password;

  Widget nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Name :',
          hintText: 'Not Blank',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey[400], width: 1.0))),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please File Name not Blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget userTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'User :',
          hintText: 'Not Blank',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey[400], width: 1.0))),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Your User';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey[400], width: 1.0))),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Your Password';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  void uploadValueToServer(BuildContext context) async {

    String urlString = 'https://www.androidthai.in.th/tid/addUserMaster.php?isAdd=true&Name=$name&User=$user&Password=$password';
    var response = await get(urlString);
    var result = json.decode(response.body);

    print('result = $result');
    if (result.toString() == 'true') {
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text('Register'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cloud_upload),
              onPressed: () {
                print('Click CloudUpload');
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  print('name = $name, user = $user, password = $password');
                  uploadValueToServer(context);
                }
              },
            )
          ],
        ),
        body: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            child: Column(
              children: <Widget>[
                nameTextFormField(),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: userTextFormField(),
                ),
                passwordTextFormField()
              ],
            ),
          ),
        ));
  }
}
