import 'package:flutter/material.dart';
import 'package:schedul_r/class_list.dart';
import 'package:schedul_r/login.dart';
import 'package:schedul_r/routing_names.dart';
import 'package:schedul_r/signup.dart';
import 'package:schedul_r/undefined_route.dart';

Route<dynamic> generateRoute(RouteSettings settings)
{
  switch(settings.name)
  {
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => Login(onSubmit: null));
    case RegisterRoute:
      return MaterialPageRoute(builder: (context) => SignupPage());
    case ClassViewRoute:
      return MaterialPageRoute(builder: (context) => ExpansionTileSample());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}