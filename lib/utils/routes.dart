import 'package:flutter/material.dart';
import 'package:schedul_r/screens/class_list.dart';
import 'package:schedul_r/models/routing_names.dart';
import 'package:schedul_r/models/undefined_route.dart';
import 'package:schedul_r/screens/login.dart';

Route<dynamic> generateRoute(RouteSettings settings)
{
  switch(settings.name)
  {
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case ClassViewRoute:
      return MaterialPageRoute(builder: (context) => ClassList());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}