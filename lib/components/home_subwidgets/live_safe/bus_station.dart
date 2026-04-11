import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/live_safe_tile.dart';
import 'package:safety_companion/utils/app_colors.dart';

class BusStation extends StatelessWidget {
  final Function? onMapFunction;
  const BusStation({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return LiveSafeTile(
      label: 'Bus Stations',
      assetPath: 'assets/bus-stop.png',
      iconBackgroundColor: AppColors.transportOrange.withOpacity(0.18),
      iconRingColor: AppColors.transportOrange.withOpacity(0.55),
      labelColor: AppColors.transportOrange,
      onTap: () {
        onMapFunction!('bus stops near me');
      },
    );
  }
}
