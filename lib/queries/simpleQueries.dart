import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:winton/screens/userpage.dart';

class GetUserFriends extends StatelessWidget {
  final String documentId;

  GetUserFriends({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
          return Text('Friends are: $documentId'); //${data['Document ID']}');
        }
        return Text('Loading...');
        })
      ),
    );
  }
}

// class getUserID extends StatelessWidget {
//   final String documentsId;

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentsId).get(),
//       builder: (((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//             snapshot.data!.data() as Map<String, dynamic>;
//           return Text('Friends are: $documentsId'); //${data['Document ID']}');
//         }
//         return Text('Loading...');
//         })
//       ),
//     );
//   }
// }