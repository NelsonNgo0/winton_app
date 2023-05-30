import 'dart:async';

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
import "package:geolocator/geolocator.dart";


class UserWidgetPage extends StatefulWidget {
  const UserWidgetPage({super.key});

  @override
  State<UserWidgetPage> createState() => UserPage();
}

class UserPage extends State<UserWidgetPage> {

  final String apiKey = "j3GimRiApypsJucBs3BIpDDWn4rc4rz8"; //tomtom api key
  final String googleAPI = "AIzaSyB2om04zfAtOF1ir3x8s2TbknvmCVMiecE"; //google api

  Position? currentPosition;
  StreamSubscription<Position>? positionStream;

  String? Long;
  String? Lat;
  String Cords = '';

  @override
  void dispose() {
    super.dispose();
    positionStream?.cancel();
  }

  @override
  void initState() {
    super.initState();
    listenToLocationChanges();
    _determinePosition();
  }

  //Logout function
  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser == null){
      Navigator.pushNamed(context, '/');
    }
  }

// THIS IS THE TOMTOM MAP WORKING WITH JUST CORDS
  @override
  Widget build(BuildContext context) {

    var long2 = double.tryParse(Long!);
    var lat2 = double.tryParse(Lat!);
    
    final tomtomHQ = new LatLng(long2!, lat2!); //for tutorial

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


  //THIS IS THE TESTING TOOL FOR LONG AND LAT DATA
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Geolocator"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ElevatedButton(onPressed: _determinePosition, child: Text('Determine Position')),
  //           SizedBox(height: 20.0,),
  //           Text(currentPosition!=null? '$currentPosition' : '----',),
  //           Text('Latitude: $Lat'),
  //           Text('Longitude: $Long')
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _determinePosition() async {
    
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled) {

      print('Location permissions are currently disabled');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      
      if (permission == LocationPermission.denied) {
        print('Location peermissions were denied');
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are denied forever, we cannot access these permissions');
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    print('position recorded');
    setState(() {
      currentPosition = position;
      Long = position.longitude.toString();
      Lat = position.latitude.toString();
    });
  }

  void getLastKnownPosition() async {
    Position? position = await Geolocator.getLastKnownPosition();
  }

  void listenToLocationChanges() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 100,
    );

    positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) {
        setState(() {
          currentPosition = position;
          Long = position?.longitude.toString();
          Lat = position?.latitude.toString();
        });
      }
    );
  }

}