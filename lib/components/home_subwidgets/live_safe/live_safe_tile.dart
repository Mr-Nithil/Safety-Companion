import 'package:flutter/material.dart';
import 'package:safety_companion/utils/app_colors.dart';

class LiveSafeTile extends StatelessWidget {
  const LiveSafeTile({
    super.key,
    required this.label,
    required this.assetPath,
    required this.onTap,
    this.iconBackgroundColor,
    this.labelColor,
    this.iconRingColor,
  });

  final String label;
  final String assetPath;
  final VoidCallback onTap;
  final Color? iconBackgroundColor;
  final Color? labelColor;
  final Color? iconRingColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: 108,
        height: 132,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.liveSafeCard,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.liveSafeBorder),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x16081528),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor ?? AppColors.liveSafeIconBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: iconRingColor ?? AppColors.liveSafeBorder,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      assetPath,
                      height: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  label,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.liveSafeLabel,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                    height: 1.2,
                  ).copyWith(color: labelColor ?? AppColors.liveSafeLabel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
