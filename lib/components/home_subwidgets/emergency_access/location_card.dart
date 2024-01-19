import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key, required this.userID});
  final String userID;

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  Future<String> _getContactNumber() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .get();

    dynamic data = snapshot.data();
    return data != null ? data['emergency contact number'] as String : '';
  }

  Future<void> _checkAndComposeMessage(
      BuildContext context, String receiverNumber) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied");
        return;
      }
    }

    await _composeMessageWithReceiver(context, receiverNumber);
  }

  Future<void> _composeMessageWithReceiver(
      BuildContext context, String receiverNumber) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    String message =
        ' EMERGENCY SITUATION ! My current location is: https://www.google.com/maps/@${position.latitude},${position.longitude},16z?entry=ttu';

    String uri = 'sms:$receiverNumber?body=${Uri.encodeComponent(message)}';

    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      print('Could not launch messaging app.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () async {
            String contactNumber = await _getContactNumber();
            _checkAndComposeMessage(context, contactNumber);
          },
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 126, 37, 83),
                      Color.fromARGB(255, 255, 0, 77),
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          child: Image.asset('assets/location.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Text('Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                )),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
