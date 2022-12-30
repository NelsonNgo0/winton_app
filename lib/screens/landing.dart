import 'package:flutter/material.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/widgets/helper_widgets.dart';

class LandingWidgetPage extends StatefulWidget {
  const LandingWidgetPage({super.key});

  @override
  State<LandingWidgetPage> createState() => LandingPage();
}

class LandingPage extends State<LandingWidgetPage> {

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
        )
      ],
    );
  }
}

// class MyStatefulWidgetPage extends StatefulWidget {
//   const MyStatefulWidgetPage({Key? key}) : super(key: key);
 
//   @override
//   State<MyStatefulWidgetPage> createState() => _MyStatefulWidgetState();
// }
 
// class _MyStatefulWidgetState extends State<MyStatefulWidgetPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
 
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Welcome to Winton',
//                   style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 30),
//                 )),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(fontSize: 20),
//                 )),
            
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ElevatedButton(
//                   child: const Text('Login'),
//                   onPressed: () {
//                     print(nameController.text);
//                     print(passwordController.text);
//                   },
//                 )
//             ),
        //     Row(
        //       children: <Widget>[
        //         const Text('Have an account already?'),
        //         TextButton(
        //           child: const Text(
        //             'Sign in',
        //             style: TextStyle(fontSize: 13),
        //           ),
        //           onPressed: () {
        //             //signup screen
        //           },
        //         )
        //       ],
        //       mainAxisAlignment: MainAxisAlignment.center,
        //     ),
        //   ],
        // ));
//   }
// }

