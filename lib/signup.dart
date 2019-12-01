import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget 
{
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> 
{
  
  @override
  Widget build(BuildContext context)
  {
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
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 75.0, fontWeight: FontWeight.bold
                    )
                  )
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
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
                  )
                ),
                SizedBox(height: 5.0),
                TextField(
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
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
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
                SizedBox(height: 50.0),
                Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(40.0),
                    shadowColor: Colors.amberAccent,
                    color: Colors.amber[500],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 'fromRegister');
                      },
                      child: Center(
                        child: Text(
                          'Register',
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
                Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(40.0),
                    shadowColor: Colors.amberAccent,
                    color: Colors.amber[500],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Go Back',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                          ),
                        ),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
