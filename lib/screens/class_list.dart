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
    // print(response.statusCode);
    // print(json.decode(response.body));
    // print("response body is: ");
    // print(response.body);
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

Future<Schedule> loadSchedule(String token) async{
  final url = "https://api.schedulr.xyz/gen_schedule";
  Map<String, String> body = {
    "token": token
  };

  final response = await http.get(
    url,
    headers: {'Authorization': 'Bearer $token'}
  );

  final jsonResponse = json.decode(response.body);
  // print(jsonResponse);
  Schedule schedule = new Schedule.fromJson(jsonResponse);
  print('this is what a class should be');
  for (var v in schedule.semesterList)
  {
    for (int i = 0; i < schedule.semesterList.length; i++)
      for (int j = 0; j < schedule.semesterList[i].courseList.length; j++)
        print(schedule.semesterList[i].courseList[j].name.toString());
  }
  return schedule;
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
  Future<Schedule> schedule;
  String token;


  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    token = settings.arguments;
    // print('Token is this hopefully pls pls pls:' + token);
    schedule = loadSchedule(token);
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
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      );
  }
}

class DetailPage extends StatelessWidget {

  final Schedule schedule;

  DetailPage(this.schedule);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(schedule.semesterList[0].courseList[0].name),
        )
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    schedule,
    <Entry>[
      Entry('Enjoyment of Music'),
      Entry('Introduction to Philosophy'),
      Entry('Computer Science II'),
      Entry('Networks and Systems'),
      Entry('Digital Systems'),
        ],
      ),
];