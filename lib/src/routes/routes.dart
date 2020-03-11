
import 'package:flutter/material.dart';
import 'package:andersgym/src/pages/home/home_page.dart';
import 'package:andersgym/src/pages/login/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
  };
}

