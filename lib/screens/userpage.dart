import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winton/routes/routes_manager.dart';
import 'package:winton/themes/custom_theme.dart';
import 'package:winton/queries/simpleQueries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:winton/widgets/helper_widgets.dart';

class UserWidgetPage extends StatefulWidget {
  const UserWidgetPage({super.key});

  @override
  State<UserWidgetPage> createState() => UserPage();
}

class UserPage extends State<UserWidgetPage> {

  final user = FirebaseAuth.instance.currentUser!;
  final userID = FirebaseAuth.instance.currentUser!.uid;

  //final displayName = FirebaseAuth.instance.currentUser.get() username;

  List<String> friendsIDs = [];

  Future getFriends() async {
  await FirebaseFirestore.instance.collection('/users/Ese4wAmWdAd2u0B6agts/friends').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      print(element.reference);
      friendsIDs.add(element.reference.id);
    })
  );
}
  //trying to get correct user id
  Future getUserName() async {
  await FirebaseFirestore.instance.collection('/users/').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      print(element.reference);
    })
  );
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'currently signed in as: ' + userID,
            ),
            

            Vertical_Spacer(30),

            Expanded(
              child: FutureBuilder(
                future: getFriends(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: friendsIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUserFriends(documentId: friendsIDs[index]),
                      );
                    },
                  );
                }
              )
            ),

            Text(
              'vcpdfiaGR61ZhhRCkdcM == ' + user.uid
            ),

            ElevatedButton(
              child: const Text('sign out'),
              onPressed: () {
                _signOut();
                Navigator.pushNamed(context, '/Landing');
              },
            ),
          ],
        )
      )  
    );
  }
}