import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_companion/components/user_infomation.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Center(
        child: Text(
          'Please sign in to view your profile.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20.0),
            Text(
              "SAFETY COMPANION",
              style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.bold,
                fontSize: 42,
                color: Color.fromARGB(255, 255, 0, 77),
              ),
            ),
            UserInformation(
              userID: user.uid,
            ),
          ]),
        ),
      ),
    );
  }
}
