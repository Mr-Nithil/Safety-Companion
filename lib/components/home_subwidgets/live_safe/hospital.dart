import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/live_safe_tile.dart';
import 'package:safety_companion/utils/app_colors.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return LiveSafeTile(
      label: 'Hospitals',
      assetPath: 'assets/hospital.png',
      iconBackgroundColor: AppColors.safeGreen.withOpacity(0.18),
      iconRingColor: AppColors.safeGreen.withOpacity(0.55),
      labelColor: AppColors.safeGreen,
      onTap: () {
        onMapFunction!('hospitals near me');
      },
    );
  }
}
