import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/bus_station.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/fuel_station.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/hospital.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/pharmacy.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/police.dart';
import 'package:safety_companion/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return SizedBox(
      height: isSmallScreen ? 156 : 162,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Tap a service to open nearby places',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isSmallScreen ? 12 : 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              children: [
                Police(onMapFunction: openMap),
                Hospital(onMapFunction: openMap),
                Pharmacy(onMapFunction: openMap),
                BusStation(onMapFunction: openMap),
                FuelStation(onMapFunction: openMap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
