import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe/live_safe_tile.dart';
import 'package:safety_companion/utils/app_colors.dart';

class Police extends StatelessWidget {
  final Function? onMapFunction;
  const Police({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return LiveSafeTile(
      label: 'Police',
      assetPath: 'assets/police-badge.png',
      iconBackgroundColor: AppColors.primaryBlue.withOpacity(0.18),
      iconRingColor: AppColors.primaryBlue.withOpacity(0.55),
      labelColor: AppColors.primaryBlue,
      onTap: () {
        onMapFunction!('police stations near me');
      },
    );
  }
}
