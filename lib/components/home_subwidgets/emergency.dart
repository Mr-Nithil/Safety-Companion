import 'package:flutter/material.dart';
import 'dart:async';
import 'package:safety_companion/components/home_subwidgets/emergency/ambulance_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/army_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/firebrigade_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/police_emergency.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final PageController _pageController = PageController();
  Timer? _timer;
  final int _numPages = 4;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 202,
      child: PageView(
        controller: _pageController,
        children: const [
          PoliceEmergency(),
          AmbulanceEmergency(),
          FirebrigadeEmergency(),
          ArmyEmergency(),
        ],
      ),
    );
  }
}
