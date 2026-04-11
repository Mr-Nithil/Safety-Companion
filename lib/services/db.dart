import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Db {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      Map<String, dynamic> data, String userId, context) async {
    await users
        .doc(userId)
        .set(data)
        .then((value) => print("User Added"))
        .catchError((error) => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(error.toString()),
                    );
                  })
            });
  }
}
