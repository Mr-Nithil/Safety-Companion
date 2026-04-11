import 'package:flutter/material.dart';
import 'package:safety_companion/components/home_subwidgets/custom_carousel_slider.dart';
import 'package:safety_companion/components/home_subwidgets/emergency.dart';
import 'package:safety_companion/components/home_subwidgets/emergency_access.dart';
import 'package:safety_companion/components/home_subwidgets/live_safe.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  static const double _sectionGap = 16;
  static const double _titleGap = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        const CustomCarouselSlider(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Quick Emergency Access'),
        const SizedBox(height: _titleGap),
        EmergencyAccess(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Explore LiveSafe'),
        const SizedBox(height: _titleGap),
        const LiveSafe(),
        const SizedBox(height: _sectionGap),
        const _SectionTitle(title: 'Emergency Contacts'),
        const SizedBox(height: _titleGap),
        const Emergency(),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
