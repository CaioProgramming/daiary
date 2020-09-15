import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const EdgeInsetsGeometry kDefaultPadding = EdgeInsets.all(16);
BorderRadius kDefaultBorderRadius = BorderRadius.circular(10);

ThemeData kdarkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    accentColor: Colors.yellowAccent.shade700,
    buttonColor: Colors.yellow.shade500,
    primarySwatch: Colors.yellow,
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      bodyText2: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w200, fontSize: 16),
      headline6: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
      headline5: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 22),
      headline4: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24),
      headline3: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 26),
      headline2: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 28),
      headline1: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 30),
      button: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      caption: TextStyle(
          color: Colors.white.withOpacity(0.70),
          fontWeight: FontWeight.bold,
          fontSize: 12),
      subtitle1: TextStyle(
          color: Colors.white.withOpacity(0.30),
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ),
    primaryColor: Colors.yellow.shade700,
    primaryColorDark: Colors.yellow.shade800);
