import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/ambulance_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/army_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/firebrigade_emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency/police_emergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 196,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 6),
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
