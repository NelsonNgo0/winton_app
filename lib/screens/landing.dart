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
    return Column(
      
      children: <Widget>[
        
        Padding(
          
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),

          child: Center(
            child: Container(
              
              width: 300,
              height: 300,
              child: Icon(Icons.add_location_rounded, size: 100, color: COLOR_PRIMARY),
            ),
          )
        ),

        Vertical_Spacer(100),

        Padding(
          padding: const EdgeInsets.all(10),

          child: Row(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
              ),

              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  Navigator.pushNamed(context, '/Rego');
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center
          ),
        ),
      ],
    );
  }
}


// For auto login - will need to implement. Im guessing it just checks the Firebase Auth instance and
// that keeps track of if the user logs out so when we pull the authStateChanges and it comes back
// with information then it pushes the user straight to the user page
// and if not then we push to login
// hopefully the snapshot has the account id and everything set up.
//class MainPage extends StatelessWidget {
//  const MainPage({Key? key}) : super({key: key});
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: StreamBuilder<User?>(
//        stream: FirebaseAuth.instance.authStateChanges(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return UserWidgetPage();
//          } else {
//            return LoginWidgetPage();
//          }
//    }
//   )
//  )
// }
//}
