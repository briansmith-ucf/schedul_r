// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:schedul_r/routing_names.dart';
import 'routes.dart' as routes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.generateRoute,
      initialRoute: LoginViewRoute,
    );
  }
}

