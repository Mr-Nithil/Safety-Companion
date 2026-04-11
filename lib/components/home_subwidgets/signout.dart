import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignOutWidget extends StatefulWidget {
  @override
  State<SignOutWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<SignOutWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
  }

  bool usericon = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              LottieBuilder.network(
                'https://lottie.host/9d7135c7-bc69-4445-a2f1-377b25d7df3b/hWmCUymVUv.json',
                controller: _controller,
                onLoaded: (composition) {
                  // Pause the animation after loading
                  _controller
                    ..duration = composition.duration
                    ..forward(from: 0.0)
                    ..addListener(() {
                      if (_controller.isCompleted) {
                        _controller.stop(); // Use stop instead of pause
                      }
                    });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 10,
                  left: 15,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  "Signed in as: ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 10,
                  left: 15,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  user?.email ?? 'Signed in user',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 196, 21, 56), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Button border radius
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
