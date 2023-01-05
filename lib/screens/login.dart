import 'package:flutter/material.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/widgets/helper_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginWidgetPage extends StatefulWidget {
  const LoginWidgetPage({super.key});

  @override
  State<LoginWidgetPage> createState() => LoginPage();
}

final _auth = FirebaseAuth.instance;
class LoginPage extends State<LoginWidgetPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  //Auto login function
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushNamed(context, '/User');
      }
      return firebaseApp;
  }
  //Login Button function
  Future log_In() async {
try {
      if(FirebaseAuth.instance.currentUser != null ){
        Navigator.pushNamed(context, '/User');
      }
      final user = await _auth.signInWithEmailAndPassword(
          email: usernameController.text.trim(), password: passwordController.text.trim());
      if (user != null) {
        print(user);
        Navigator.pushNamed(context, '/User');
      }
    } catch (e) {
      print(e);
    }
  }

  // Dispose when not in use 
  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),

          Vertical_Spacer(20),

          Container(
            child: TextField(
              controller: passwordController,
              obscureText: true,
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
                log_In();
              },
            )
          )
        ],
      )
    );
  }
}