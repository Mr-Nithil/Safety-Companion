import 'package:flutter/material.dart';

class Police extends StatelessWidget {
  final Function? onMapFunction;
  const Police({super.key, this.onMapFunction});

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
                onMapFunction!('police stations near me');
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
                      'assets/police-badge.png',
                      height: 32,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Police Stations',
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
