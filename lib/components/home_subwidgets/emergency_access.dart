import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/call_card.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access/location_card.dart';
import 'package:safety_companion/utils/app_colors.dart';

class EmergencyAccess extends StatelessWidget {
  EmergencyAccess({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final isNarrow = MediaQuery.of(context).size.width < 380;

    if (user == null) {
      return const Center(
        child: Text(
          'Please sign in to access emergency features.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: isNarrow
          ? Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CallCard(
                    userID: user.uid,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: LocationCard(
                    userID: user.uid,
                  ),
                ),
              ],
            )
          : Row(
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
