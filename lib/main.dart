// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget 
{
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> 
{
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  void initState() 
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  void _submit()
  {
    final form = formKey.currentState;

    if (form.validate())
    {
      form.save();
      performLogin();
    }
  }

  void performLogin()
  {
    final snackbar = new SnackBar(
      content: new Text("Email: $_email, password: $_password"),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: "Email"),
                validator: (val) => !val.contains('@') ? 'Invalid Email' : null,
                onSaved: (val) => _email = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                validator: (val) => val.length < 6 ? 'Password too short' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 50.0),
              ),
              new RaisedButton(
                child: new Text("Login"),
                onPressed: _submit,
              )
            ],
          )
        )
        )
    );
  }
}
