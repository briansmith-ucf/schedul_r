import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedul_r/models/routing_names.dart';


class BasicDrawer extends StatefulWidget {
  var token;
  BasicDrawer({
    this.token
  });
  @override
  _BasicDrawerState createState() => _BasicDrawerState();
}

class _BasicDrawerState extends State<BasicDrawer>  {
  @override
  Widget build(BuildContext context) {
    String token;
    RouteSettings settings = ModalRoute.of(context).settings;
    token = settings.arguments;
    return Drawer(
      child: Container(
        padding: new EdgeInsets.all(32.0),
        child: ListView(children: <Widget>[
          ListTile(title: Text("Logout", style: TextStyle(
              color: Colors.black, fontSize: 20.0),),
            onTap: () {
              
                Navigator.of(context).pushReplacementNamed(LoginViewRoute);
            },
          ),
        ],),
      ),
    );
  }
}