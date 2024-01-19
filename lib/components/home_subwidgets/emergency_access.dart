import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/call_card.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/location_card.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyAccess extends StatelessWidget {
  EmergencyAccess({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  final userID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CallCard(
            userID: userID,
          ),
          LocationCard(
            userID: userID,
          ),
        ],
      ),
    );
  }
}
