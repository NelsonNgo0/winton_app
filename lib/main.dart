import 'package:flutter/material.dart';
import 'package:winton/routes/routes_manager.dart';
import 'package:winton/screens/landing.dart';
import 'package:winton/screens/login.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/themes/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'Winton';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: lightTheme,
      initialRoute: '/',
      routes: customRoutes,
    );
  }
}
