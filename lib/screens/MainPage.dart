import 'package:daiary/screens/NotesPage.dart';
import 'package:daiary/screens/TodayPage.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class MainPage extends StatefulWidget {
  static String route = '/home';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    TodayPage(),
    NotesPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Utils.setBarAndNavColor(context,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor);
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: SizedBox(), title: Text('Home')),
          BottomNavigationBarItem(icon: SizedBox(), title: Text('Today')),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
