import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegoWidgetPage extends StatefulWidget {
  const RegoWidgetPage({super.key});

  @override
  State<RegoWidgetPage> createState() => RegoPage();
}

class RegoPage extends State<RegoWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Yes'),
      ),
    );
  }
}