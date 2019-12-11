import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedul_r/functions/saveCurrentLogin.dart';
import 'package:schedul_r/models/loginModel.dart';
import 'package:schedul_r/models/routing_names.dart';
import 'package:schedul_r/screens/class_list.dart';
import 'package:schedul_r/widgets/showDialogSingleButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

Future<LoginModel> requestLoginAPI(BuildContext context, String email, String password, String token) async {
  final url = "https://api.schedulr.xyz/login";

  Map<String, String> body = {
    "email": email,
    "password": password
  };
  
 print("here");
  final response = await http.post(
    url,
    body: json.encode(body),
    headers: {"Content-Type": "application/json"}
  );
  print("got response!"); 

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);

    token = responseJson['access_token'];
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushNamed('/class', arguments: token);

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute(LoginViewRoute);
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context)
  {
    String token;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'SchedulR',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 75.0, fontWeight: FontWeight.bold
                    )
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(125.0, 200.0, 0.0, 0.0),
                  child: Text(
                    'U Can Finish',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0, fontWeight: FontWeight.bold
                    )
                  )
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Form(
                  child: TextFormField(
                    controller: _userNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber[500])
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Form(
                  child: TextFormField(
                    controller: _passwordController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber[500])
                      )
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 60.0,
                  child: Material(
                    child: GestureDetector(
                        onTap: () {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                          requestLoginAPI(context, _userNameController.text, _passwordController.text, token);
                        },
                        onLongPress: () {Navigator.of(context).pushNamed('/class2');},

                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                          ),
                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
