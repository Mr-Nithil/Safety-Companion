import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  UserInformation({super.key, required this.userID});
  final String userID;

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data?.data() as Map<String, dynamic>?;
        if (data == null) {
          return const Text('No profile data available');
        }

        return SingleChildScrollView(
          child: UserCard(
            data: data,
            userID: widget.userID,
          ),
        );
      },
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.data, required this.userID});
  final Map<String, dynamic> data;
  final String userID;

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.3;

    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 255, 0, 77),
              size: iconSize,
            ),
            SizedBox(height: 12.0),
            buildInfoTile("First Name", data['first name']),
            buildInfoTile("Last Name", data['last name']),
            buildInfoTile("Email", data['email']),
            buildInfoTile("Birthday", data['birthday']),
            buildInfoTile("Address", data['address']),
            buildInfoTile(
                "Emergency Contact Number", data['emergency contact number']),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(String label, String value) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(value),
    );
  }
}
