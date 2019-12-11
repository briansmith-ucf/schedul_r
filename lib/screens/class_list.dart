import 'dart:io';

import 'package:schedul_r/widgets/basicDrawer.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:schedul_r/models/scheduleModel.dart';

Future<Schedule> requestScheduleAPI(BuildContext context, String token) async {
  final url = "https://api.schedulr.xyz/gen_schedule";
  print('we are in request schedule api');
  print(token);
  print('is this a token?');

  Map<String, String> body = {
    "token": token
  };

  final response = await http.get(
    url,
    headers: {'Authorization': 'Bearer $token'}
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print('she was successful');
    print(response.statusCode);
    print(json.decode(response.body));
    print("response body is: ");
    print(response.body);
    var schedule = new Schedule.fromJson(responseJson);

    return Schedule.fromJson(responseJson);
  } else {
    print('get fucked');
    final responseJson = json.decode(response.body);
    print(response.statusCode);
    print(responseJson);
    return null;
  }
}

class ClassList extends StatefulWidget {
  var token;
  ClassList({
    this.token
  });
  
  @override
  _ClassListState createState() => new _ClassListState();
}

class _ClassListState extends State<ClassList> {
  Future<http.Response> _responseFuture;
  String token;
  

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    token = settings.arguments;
    print('Token is this hopefully pls pls pls:' + token);
    requestScheduleAPI(context, token);
    // var drawer = Drawer();
    return new Scaffold(
      drawer: Drawer(
      child: Container(
        padding: new EdgeInsets.all(32.0),
        child: ListView(children: <Widget>[
          ListTile(title: Text("Logout", style: TextStyle(
              color: Colors.black, fontSize: 20.0),),
            onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],),
      ),
    ),
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Schedule for (insert name here)'),
        backgroundColor: Colors.amber[500],
        elevation: 5.0,
      ),
      body: new FutureBuilder(
        future: _responseFuture,
        builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
          if (!response.hasData) {
            return const Center(
              child: const Text('Loading...'),
            );
          } else if (response.data.statusCode != 200) {
            return const Center(
              child: const Text('Error loading data'),
            );
          } else {
            List<dynamic> jsonn = json.decode(response.data.body);
            return new MyExpansionTileList(jsonn);
          }
        },
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  final String title, content, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.content,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(); // To close the dialog
                },
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: Consts.padding,
        right: Consts.padding,
        child: CircleAvatar(
          backgroundColor: Colors.amber[500],
          radius: Consts.avatarRadius,
        ),
      ),
    ],
  );
  }
}

class MyExpansionTileList extends StatelessWidget {
  final List<dynamic> elementList;

  MyExpansionTileList(this.elementList);

  List<Widget> _getChildren() {
    List<Widget> children = [];
    elementList.forEach((element) {
      children.add(
        Card(
        child: MyExpansionTile(element['id'], element['name']),
      ));
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _getChildren(),
    );
  }
}

class MyExpansionTile extends StatefulWidget {
  final int id;
  final String title;
  MyExpansionTile(this.id, this.title);
  @override
  State createState() => new MyExpansionTileState();
}

class MyExpansionTileState extends State<MyExpansionTile> {
  PageStorageKey _key;
  Completer<http.Response> _responseCompleter = new Completer();

  @override
  Widget build(BuildContext context) {
    _key = new PageStorageKey('${widget.id}');
    return new ExpansionTile(
      key: _key,
      title: new Text(widget.title),
      // onExpansionChanged: (bool isExpanding) {
      //   if (!_responseCompleter.isCompleted) {
      //     _responseCompleter.complete(http.get('https://jsonplaceholder.typicode.com/users'));
      //      print("Getting Expansion Item # ${widget.id}");
      //   }
      // },
      children: <Widget>[
        new FutureBuilder(
          future: _responseCompleter.future,
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> response) {
            if (!response.hasData) 
            {
              return const Center(
                child: const Text('Loading...'),
              );
            } else if (response.data.statusCode != 200) {
              return const Center(
                child: const Text('Error loading data'),
              );
            } else {
              List<dynamic> json_data = json.decode(response.data.body);
              List<Widget> reasonList = [];
              json_data.forEach((element) {
                reasonList.add( new ListTile(
                  dense: true,
                  title: new Text(element['email']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Address",
                        content: element['address']['street'] + '\n' + element['address']['city'] + '\n' + element['address']['zipcode'],
                        buttonText: "Okay",
                      ),
                    );
                  },
                ));
              });
              return new Column(children: reasonList);
            }
          },
        )
      ],
    );
  }
}