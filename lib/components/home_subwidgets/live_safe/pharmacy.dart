import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/live_safe_tile.dart';
import 'package:safety_companion/utils/app_colors.dart';

class Pharmacy extends StatelessWidget {
  final Function? onMapFunction;
  const Pharmacy({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return LiveSafeTile(
      label: 'Pharmacies',
      assetPath: 'assets/pharmacy.png',
      iconBackgroundColor: AppColors.pharmacyTeal.withOpacity(0.18),
      iconRingColor: AppColors.pharmacyTeal.withOpacity(0.55),
      labelColor: AppColors.pharmacyTeal,
      onTap: () {
        onMapFunction!('pharmacies near me');
      },
    );
  }
}
