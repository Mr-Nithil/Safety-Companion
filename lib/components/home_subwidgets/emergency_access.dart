import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/call_card.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/location_card.dart';

class EmergencyAccess extends StatelessWidget {
  EmergencyAccess({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Center(
        child: Text(
          'Please sign in to access emergency features.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CallCard(
              userID: user.uid,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: LocationCard(
              userID: user.uid,
            ),
          ),
        ],
      ),
    );
  }
}
