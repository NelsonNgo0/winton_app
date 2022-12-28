import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidgetPage extends StatefulWidget {
  const LoginWidgetPage({super.key});

  @override
  State<LoginWidgetPage> createState() => LoginPage();
}

class LoginPage extends State<LoginWidgetPage> {

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

