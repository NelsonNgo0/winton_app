import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winton/routes/routes_manager.dart';
import 'package:winton/themes/custom_theme.dart';

class UserWidgetPage extends StatefulWidget {
  const UserWidgetPage({super.key});

  @override
  State<UserWidgetPage> createState() => UserPage();
}

class UserPage extends State<UserWidgetPage> {

  //Logout function
  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser == null){
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('sign out'),
          onPressed: () {
            _signOut();
            Navigator.pushNamed(context, '/Landing');
          },
        ),
      )
    );
  }
}