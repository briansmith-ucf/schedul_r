import 'package:flutter/material.dart';
import 'package:schedul_r/routing_names.dart';
// import 'routes.dart' as routes;

// class MyHomePage extends StatefulWidget 
// {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

class Login extends StatelessWidget 
{
  const Login({Key key, @required this.onSubmit,}) : super(key: key);

  final VoidCallback onSubmit;
  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;


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
                TextField(
                  controller: _user,
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
                SizedBox(height: 20.0),
                TextField(
                  controller: _user,
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
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top:20.0, left: 20.0),
                  child: InkWell(
                    child: Text('Forgot Password?', 
                    style: TextStyle(
                      color: Colors.amber[500],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline)
                    )
                  )
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
                        Navigator.pushNamed(context, ClassViewRoute);
                      },
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
                Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(40.0),
                    shadowColor: Colors.amberAccent,
                    color: Colors.amber[500],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        var navigationResult = await Navigator.pushNamed(context, RegisterRoute);
                        if (navigationResult == 'fromRegister')
                        {
                          showDialog(context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Successfully Registered!")
                          ));
                        }
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


