import 'package:flutter/material.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/widgets/helper_widgets.dart';

class LoginWidgetPage extends StatefulWidget {
  const LoginWidgetPage({super.key});

  @override
  State<LoginWidgetPage> createState() => LoginPage();
}

class LoginPage extends State<LoginWidgetPage> {
  //TextEditingController usernameController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: COLOR_BACKGROUND,
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                color: COLOR_PRIMARY
              )
            ),
          ),

          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),

          Vertical_Spacer(20),

          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),

          Vertical_Spacer(20),

          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/User');
              },
            )
          )
        ],
      )
    );
  }
}