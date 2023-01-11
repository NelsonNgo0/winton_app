import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winton/routes/routes_manager.dart';
import 'package:winton/themes/custom_theme.dart';
import "package:flutter_map/flutter_map.dart";
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "package:latlong2/latlong.dart";


class UserWidgetPage extends StatefulWidget {
  const UserWidgetPage({super.key});

  @override
  State<UserWidgetPage> createState() => UserPage();
}

class UserPage extends State<UserWidgetPage> {

  final String apiKey = "j3GimRiApypsJucBs3BIpDDWn4rc4rz8";

  //Logout function
  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser == null){
      Navigator.pushNamed(context, '/');
    }
  }


  @override
  Widget build(BuildContext context) {
    final tomtomHQ = new LatLng(52.376372, 4.908066); //for tutorial

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              options: new MapOptions(center: tomtomHQ, zoom: 13.0),
              layers:[
                new TileLayerOptions(
                  urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                          "{z}/{x}/{y}.png?key={apiKey}",
                          additionalOptions: {"apiKey": apiKey},
                )
              ]
            )
          ]
        )
      )
    );
  }
}