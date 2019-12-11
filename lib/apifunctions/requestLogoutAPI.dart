import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:schedul_r/functions/getToken.dart';
import 'package:schedul_r/functions/saveLogout.dart';
import 'package:schedul_r/models/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "https://www.yoururl.com/logout";

  var token;

  await getToken().then((result) {
    token = result;
  });

}