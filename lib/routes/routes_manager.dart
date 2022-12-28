import 'package:flutter/material.dart';
import '../screens/landing.dart';
import '../screens/login.dart';
import '../main.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => LandingPage(),
  '/Login': (context) => LoginPage(),
};