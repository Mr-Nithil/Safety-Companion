import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/custom_carousel_slider.dart';
import 'package:safety_companion/components/home_subwidgets/emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe.dart';
import 'package:safety_companion/utils/app_colors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  static const double _sectionGap = 18;
  static const double _titleGap = 10;
  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        _HomeHeader(isSmallScreen: isSmallScreen),
        const SizedBox(height: _sectionGap),
        const CustomCarouselSlider(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Quick Emergency Access'),
        const SizedBox(height: _titleGap),
        EmergencyAccess(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Explore LiveSafe Nearby'),
        const SizedBox(height: _titleGap),
        const LiveSafe(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Emergency Contacts'),
        const SizedBox(height: _titleGap),
        const Emergency(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.isSmallScreen});

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: HomeWidget._horizontalPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBlue,
              AppColors.surface,
            ],
          ),
          border: Border.all(color: AppColors.primaryBlue.withOpacity(0.35)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 14,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: isSmallScreen ? 42 : 50,
              height: isSmallScreen ? 42 : 50,
              decoration: const BoxDecoration(
                color: Color(0x22FFFFFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield_rounded,
                color: Colors.white,
                size: isSmallScreen ? 24 : 28,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stay Alert, Stay Safe',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: isSmallScreen ? 18 : 20,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Quick actions and nearby support, all in one place.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                      fontSize: isSmallScreen ? 12.5 : 13.5,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: HomeWidget._horizontalPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 360 ? 18 : 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
