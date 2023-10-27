import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task3_homepage/homepage.dart';

class NavBarCode extends StatefulWidget {
  @override
  State<NavBarCode> createState() => _NavBarCodeState();
}

class _NavBarCodeState extends State<NavBarCode> {
  int _selctedIndex = 0;
  final _screens = [
    Homepage(),
    //Messages page will be created
    Container(),
    //schedule page
    //SchedulePage(),
    //settings page
    //Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selctedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromARGB(255, 36, 214, 205),
            unselectedItemColor: Colors.black26,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: _selctedIndex,
            onTap: (index) {
              setState(() {
                _selctedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "Schedule",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ]),
      ),
    );
  }
}
