import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    backgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}
TextTheme textTheme(){
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold
    ),
    headline2: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold
    ),
    headline3: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
    headline4: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold
    ),
    headline5: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold
    ),
    headline6: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 15
    ),
    bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20
    ),

  );
}