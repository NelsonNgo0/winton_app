// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

//colors used throughout the app
const COLOR_PRIMARY = Color.fromRGBO(	230, 137, 107, 1.0);
const COLOR_BUTTON = Color.fromRGBO(	207, 159, 255, 1.0);
const COLOR_BACKGROUND = Color.fromRGBO(	54, 69, 79, 1.0);
const COLOR_TEXT = Color.fromRGBO( 250, 249, 246, 1.0);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  
  primaryColor: COLOR_PRIMARY,
  backgroundColor: COLOR_BACKGROUND,
  
  buttonTheme: ButtonThemeData(
    buttonColor: COLOR_BUTTON,
  ),
  //We can use other buttons not just elevated buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        COLOR_BUTTON
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontFamily: 'Satoshi',
          color: COLOR_TEXT,
          fontSize: 14,
        ),
      ),
    )
  ),

  textTheme: TextTheme(
    //can change whatever text thingy we want to use
    titleLarge: TextStyle(color: COLOR_TEXT),
  ),

  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0), 
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0), 
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1), 
    labelStyle: TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 14,
      color: COLOR_TEXT,
    ),
  ),
  scaffoldBackgroundColor: COLOR_BACKGROUND,
  cardColor: COLOR_BACKGROUND,
  canvasColor: COLOR_BACKGROUND,

);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark
);