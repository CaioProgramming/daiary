import 'package:daiary/constants.dart';
import 'package:daiary/screens/HelpPage.dart';
import 'package:daiary/screens/LoginPage.dart';
import 'package:daiary/screens/MainPage.dart';
import 'package:daiary/screens/NotesPage.dart';
import 'package:daiary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.setBarAndNavColor(context);
    return MaterialApp(
      title: 'Diary',
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          primarySwatch: Colors.yellow,
          buttonColor: Colors.yellow[800],
          accentColor: Colors.yellowAccent.shade400,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.yellow[700]),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.yellow[700],
              selectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedItemColor: Theme.of(context).hintColor)),
      darkTheme: kdarkTheme.copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          buttonColor: Colors.yellow[500],
          accentColor: Colors.yellowAccent.shade400,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.black,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              selectedItemColor: Colors.yellow[700],
              unselectedItemColor: Colors.grey)),
      home: LoginPage(),
      routes: {
        LoginPage.route: (context) => LoginPage(),
        MainPage.route: (context) => MainPage(),
        HelpPage.route: (context) => HelpPage(),
        NotesPage.route: (context) => NotesPage(),
      },
    );
  }
}
