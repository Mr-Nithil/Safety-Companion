import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:safety_companion/components/home_widget.dart';
import 'package:safety_companion/components/profile_widget.dart';
import 'package:safety_companion/utils/app_colors.dart';

import '../components/home_subwidgets/signout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;

  List<Widget> get items => [
        Icon(
          Icons.person,
          color: index == 0 ? AppColors.primaryBlue : AppColors.textSecondary,
        ),
        Icon(
          Icons.home,
          color: index == 1 ? AppColors.primaryBlue : AppColors.textSecondary,
        ),
        Icon(
          Icons.logout,
          color: index == 2 ? AppColors.primaryBlue : AppColors.textSecondary,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
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
          backgroundColor: AppColors.background,
          color: AppColors.surface,
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
