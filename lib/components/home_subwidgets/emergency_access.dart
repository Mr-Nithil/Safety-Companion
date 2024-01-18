import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/call_card.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/location_card.dart';

class EmergencyAccess extends StatelessWidget {
  const EmergencyAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [CallCard(), LocationCard()],
      ),
    );
  }
}
