import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:schedul_r/models/scheduleModel.dart';

Future<Course> requestScheduleAPI(BuildContext context, int max_classes) async {
  final url = "https://api.schedulr.xyz/gen_schedule";

  Map<int, int> body = {
    max_classes: max_classes
  };
  

  final response = await http.post(
    url,
    body: json.encode(body),
    headers: {"Content-Type": "application/json"}
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var schedule = new Course.fromJson(responseJson);

    return Course.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    print('get fucked');
    print(response.statusCode);
    print(responseJson);
    return null;
  }
}