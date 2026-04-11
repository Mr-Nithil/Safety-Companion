import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Unable to load user name');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final document = snapshot.data;
          final data = document?.data() as Map<String, dynamic>?;
          if (data == null) {
            return const Text('User not found');
          }
          return Text('First Name: ${data['first name'] ?? ''}');
        }
        return const Text('loading...');
      }),
    );
  }
}
