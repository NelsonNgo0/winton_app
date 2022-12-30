import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserWidgetPage extends StatefulWidget {
  const UserWidgetPage({super.key});

  @override
  State<UserWidgetPage> createState() => UserPage();
}

class UserPage extends State<UserWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: ElevatedButton(
          child: const Text('Landing'),
          onPressed: () {
            Navigator.pushNamed(context, '/Landing');
          },
        ),
      ),

    );
  }
}