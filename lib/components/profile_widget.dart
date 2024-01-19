import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:safety_companion/components/user_infomation.dart';
import 'package:safety_companion/read_data/get_user-name.dart';
import 'package:safety_companion/screens/home_screen.dart';
import 'package:safety_companion/screens/login_screen.dart';

class ProfileWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final userID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
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
              userID: userID,
            ),
          ]),
        ),
      ),
    );
  }
}
