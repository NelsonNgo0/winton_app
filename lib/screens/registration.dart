import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/widgets/helper_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushNamed(context, '/Login');

      } on FirebaseAuthException catch (e){
        if(e.code == 'email-already-in-use'){
          showDialog(context: context, builder: (context) => AlertDialog(
            titleTextStyle: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  color: COLOR_PRIMARY
                  ),
            backgroundColor: COLOR_BACKGROUND,
            title: Text('Email already in use'),
            contentTextStyle: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  color: COLOR_TEXT
                  ),
            content: Text('Inputted email is already in use. Please attempt to login or reset your password.',style: TextStyle(color: COLOR_TEXT),)
            ),
            );
            return false;
        }
        if(e.code == 'invalid-email'){
            showDialog(context: context, builder: (context) => AlertDialog(
            titleTextStyle: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  color: COLOR_PRIMARY
                  ),
            backgroundColor: COLOR_BACKGROUND,
            title: Text('Invalid Email'),
            content: Text('Inputted email is invalid. Please input a valid email address.',style: TextStyle(color: COLOR_TEXT),)
            ),
            );
            return false;
        }
      }

      // add user details to DB through the adduserdetails
      addUserDetails(
        nameController.text.trim(), emailController.text.toLowerCase().trim(),
      );
    }
  }
  
  // adding to the user - made for scaling if we want to add full name and ages
  Future addUserDetails(String username, String email) async { //change users to whatever its called
    await FirebaseFirestore.instance.collection('users').add({
      'display_Name': username,
      'email' : email,
    });
    // push to landing page after sign up is success full
    Navigator.pushNamed(context, '/Landing');
  }

  //system check for password confirmation
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == passwordconfirmController.text.trim() && _passwordController.text.trim().length > 6) {
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Password length must be atleast 6 characters');
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //title
              Text(
                'Welcome to',
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: COLOR_PRIMARY,
                ),
              ),
              Text(
                'Winton',
                style: GoogleFonts.bebasNeue(
                  fontSize: 100,
                  color: COLOR_PRIMARY,
                ),
              ),
              
              Vertical_Spacer(10.0),
              //name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'What do we call you?',
                  ),
                ),
              ),

              Vertical_Spacer(10.0),
              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
              ),

              Vertical_Spacer(10.0),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),

              Vertical_Spacer(10.0),
              //password conf
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passwordconfirmController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm your Password',
                  ),
                ),
              ),

              Vertical_Spacer(15.0),
              //submit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed:() {
                    signUp();
                  },
                ),
              ),

              Vertical_Spacer(5.0),
              //back to login
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 13,
                          color: COLOR_TEXT,
                        ),
                      ),

                      InkWell(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 13,
                            color: COLOR_PRIMARY,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                      )
                    ]
                  ),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}