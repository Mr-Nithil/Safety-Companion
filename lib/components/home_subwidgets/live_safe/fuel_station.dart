import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/live_safe_tile.dart';
import 'package:safety_companion/utils/app_colors.dart';

class FuelStation extends StatelessWidget {
  final Function? onMapFunction;
  const FuelStation({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return LiveSafeTile(
      label: 'Fuel Stations',
      assetPath: 'assets/fuel-station.png',
      iconBackgroundColor: AppColors.transportOrange.withOpacity(0.18),
      iconRingColor: AppColors.transportOrange.withOpacity(0.55),
      labelColor: AppColors.transportOrange,
      onTap: () {
        onMapFunction!('fuel stations near me');
      },
    );
  }
}
