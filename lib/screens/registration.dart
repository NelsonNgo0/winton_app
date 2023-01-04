import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegoWidgetPage extends StatefulWidget {
  const RegoWidgetPage({super.key});

  @override
  State<RegoWidgetPage> createState() => RegoPage();
}

class RegoPage extends State<RegoWidgetPage> {
  //text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final passwordconfirmController = TextEditingController();

  @override

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    _passwordController.dispose();
    passwordconfirmController.dispose();
    super.dispose();
  }

  //user authentication/creation
  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // add user details to DB through the adduserdetails
      addUserDetails(
        nameController.text.trim(),
      );
    }
  }
  
  // adding to the user - made for scaling if we want to add full name and ages
  Future addUserDetails(String username) async { //change users to whatever its called
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
          passwordconfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Yes'),
      ),
    );
  }
}