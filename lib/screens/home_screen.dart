import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/custom_carousel_slider.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe.dart';
import 'package:safety_companion/components/home_subwidgets/emergency.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:safety_companion/components/home_widget.dart';
import 'package:safety_companion/components/profile_widget.dart';

import '../components/home_subwidgets/signout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = const [
    Icon(
      Icons.person,
      color: Color.fromARGB(255, 29, 43, 83),
    ),
    Icon(
      Icons.home,
      color: Color.fromARGB(255, 29, 43, 83),
    ),
    Icon(
      Icons.logout,
      color: Color.fromARGB(255, 29, 43, 83),
    ),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 43, 83),
        /*appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.security,
                color: Colors.black,
                size: 25.0,
              ),
              Text(
                " PERSONAL SAFETY COMPANION",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),*/
        body: SafeArea(
            child: Container(
          /*decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 30, 144, 255), // Dodger blue
                Color.fromARGB(255, 0, 104, 155), // Dark cyan
                Color.fromARGB(255, 0, 32, 48),
              ])),*/
          child: ListView(
            children: [
              getSelectedWidget(index: index),
            ],
          ),
        )),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Color.fromARGB(255, 214, 8, 70),
          height: 60,
          animationDuration: Duration(milliseconds: 300),
          items: items,
          index: index,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
        ));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = ProfileWidget();
        break;
      case 1:
        widget = HomeWidget();
        break;
      default:
        widget = SignOutWidget();
        break;
    }
    return widget;
  }
}
