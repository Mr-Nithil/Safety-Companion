import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/services/db.dart';

class AuthService {
  var db = Db();
  Future<void> createUser(Map<String, dynamic> data, context) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: data['email'],
      password: data['password'],
    );

    final userId = credential.user?.uid;
    if (userId == null) {
      throw FirebaseAuthException(
        code: 'user-not-created',
        message: 'Unable to create the user account.',
      );
    }

    await db.addUser(data, userId, context);
  }

  String _getFirebaseAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case '':
        return "Invalid email";
      default:
        return "Invalid credentials";
    }
  }

  Future<void> loginUser(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'], password: data['password']);
      print("Login Successful");
    } catch (e) {
      String errorMessage = "An error occurred";
      if (e is FirebaseAuthException) {
        errorMessage = _getFirebaseAuthErrorMessage(e);
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
          );
        },
      );
    }
  }

  signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
