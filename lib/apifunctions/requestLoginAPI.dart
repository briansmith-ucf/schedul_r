import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schedul_r/functions/saveCurrentLogin.dart';
import 'package:schedul_r/models/routing_names.dart';
import 'package:schedul_r/widgets/showDialogSingleButton.dart';
import 'dart:convert';

import 'package:schedul_r/models/loginModel.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String email, String password, String token) async {
  final url = "https://api.schedulr.xyz/login";

  Map<String, String> body = {
    "email": email,
    "password": password
  };
  

  final response = await http.post(
    url,
    body: json.encode(body),
    headers: {"Content-Type": "application/json"}
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);

    token = responseJson['access_token'];
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed(ClassViewRoute);

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    print('get fucked');
    print(response.statusCode);
    print(responseJson);
    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}