import 'package:flutter/material.dart';
import 'package:winton/screens/registration.dart';
import 'package:winton/screens/userpage.dart';
import '../screens/landing.dart';
import '../screens/login.dart';
import '../main.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => LandingWidgetPage(),
  '/Login': (context) => LoginWidgetPage(),
  '/Landing':(context) => LandingWidgetPage(),
  '/Rego':(context) => RegoWidgetPage(),
  '/User':(context) => UserWidgetPage(),
};