import 'package:flutter/material.dart';
import '../screens/landing.dart';
import '../screens/login.dart';
import '../main.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => LandingWidgetPage(),
  '/Login': (context) => LoginWidgetPage(),
   '/Landing':(context) => LandingWidgetPage(),
};