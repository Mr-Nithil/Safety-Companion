import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/ambulance_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/army_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/firebrigade_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/police_emergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          FirebrigadeEmergency(),
          ArmyEmergency(),
        ],
      ),
    );
  }
}
