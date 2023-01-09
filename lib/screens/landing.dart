// ignore_for_file: prefer_const_constructors
// ignore_for_file: depend_on_referebced_packages
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/widgets/helper_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winton/routes/routes_manager.dart';

class LandingWidgetPage extends StatefulWidget {
  const LandingWidgetPage({super.key});

  @override
  State<LandingWidgetPage> createState() => LandingPage();
}

class LandingPage extends State<LandingWidgetPage> {
     //Auto login function
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Fluttertoast.showToast(msg: user.displayName.toString());
        Fluttertoast.showToast(msg: user.uid.toString());
        Navigator.pushNamed(context, '/User');
      }
      return firebaseApp;
  }

  @override
  initState() {
     _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 10),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Icon(Icons.add_location_rounded, size: 100, color: COLOR_PRIMARY),
                ),
              )
            ),

            Vertical_Spacer(175),

            Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Horizontal_Spacer(25),

                  Expanded (
                    child: Center(
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                      )
                    )
                  ),

                  Expanded (
                    child: Center(
                      child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Rego');
                        },
                      )
                    )
                  ),

                  Horizontal_Spacer(25),

                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
