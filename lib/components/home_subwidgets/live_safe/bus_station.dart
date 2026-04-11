import 'package:flutter/material.dart';

class BusStation extends StatelessWidget {
  final Function? onMapFunction;
  const BusStation({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                onMapFunction!('bus stops near me');
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 201, 123, 163),
                          Color.fromARGB(255, 209, 64, 108),
                        ])),*/
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      'assets/bus-stop.png',
                      height: 32,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Bus Stations',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromARGB(255, 214, 8, 70),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
