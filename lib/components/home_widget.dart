import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/custom_carousel_slider.dart';
import 'package:safety_companion/components/home_subwidgets/emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Column(
        children: [
          SizedBox(
            width: 16.0, // Specify width if horizontal space is needed
            height: 10.0, // Specify height if vertical space is needed
          ),
          /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.security,
                      color: Color.fromARGB(255, 250, 239, 39),,
                      size: 25.0,
                    ),
                    Text(
                      " PERSONAL SAFETY COMPANION",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 250, 239, 39),
                      ),
                    ),
                  ],
                ),*/
          CustomCarouselSlider(),
          /*Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                  child: Text(
                    textAlign: TextAlign.left,
                    "Emergency Share",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),*/
          SizedBox(
            width: 16.0, // Specify width if horizontal space is needed
            height: 18.0, // Specify height if vertical space is needed
          ),
          EmergencyAccess(),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15),
            child: Text(
              "Explore LiveSafe",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          LiveSafe(),
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 10,
              left: 15,
            ),
            child: Text(
              textAlign: TextAlign.left,
              "Emergency Access",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Emergency(),
          SizedBox(
            width: 16.0, // Specify width if horizontal space is needed
            height: 18.0, // Specify height if vertical space is needed
          ),
        ],
      ),
    );
  }
}
