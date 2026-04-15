import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_companion/components/user_infomation.dart';
import 'package:safety_companion/utils/app_colors.dart';
import 'package:safety_companion/services/auth_services.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Center(
        child: Text(
          'Please sign in to view your profile.',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      );
    }

    final userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots();

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: userStream,
      builder: (context, snapshot) {
        final userData = snapshot.data?.data();
        final firstName = (userData?['first name'] ?? '').toString().trim();
        final lastName = (userData?['last name'] ?? '').toString().trim();
        final fullName = [firstName, lastName]
            .where((part) => part.isNotEmpty)
            .join(' ')
            .trim();
        final displayName = fullName.isNotEmpty
            ? fullName
            : (user.displayName?.trim().isNotEmpty ?? false)
                ? user.displayName!.trim()
                : (user.email?.split('@').first ?? 'Safety User');

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ...existing code for profile and info cards...
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryBlue,
                      AppColors.surface,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: AppColors.primaryBlue.withOpacity(0.35)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        color: Color(0x22FFFFFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 36,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            user.email ?? 'No email found',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              UserInformation(userID: user.uid),
              const SizedBox(height: 22),
              const _StaticInfoCard(
                title: 'Quick Safety Advice',
                icon: Icons.lightbulb_outline,
                accentColor: AppColors.transportOrange,
                gradientColors: [
                  AppColors.transportOrange,
                  AppColors.primaryBlue,
                ],
                child: Column(
                  children: [
                    _AdviceRow(
                      icon: Icons.location_on_outlined,
                      text:
                          'Keep your location services enabled when traveling.',
                    ),
                    SizedBox(height: 10),
                    _AdviceRow(
                      icon: Icons.call_outlined,
                      text:
                          'Save emergency contacts and keep your phone charged.',
                    ),
                    SizedBox(height: 10),
                    _AdviceRow(
                      icon: Icons.shield_outlined,
                      text: 'Share trip details with a trusted person.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const _StaticInfoCard(
                title: 'Emergency Kit Checklist',
                icon: Icons.inventory_2_outlined,
                accentColor: AppColors.pharmacyTeal,
                gradientColors: [
                  AppColors.pharmacyTeal,
                  AppColors.safeGreen,
                ],
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _KitChip(label: 'Water', color: AppColors.safeGreen),
                    _KitChip(
                        label: 'Power Bank', color: AppColors.pharmacyTeal),
                    _KitChip(label: 'First Aid', color: AppColors.safeGreen),
                    _KitChip(
                        label: 'Flashlight', color: AppColors.transportOrange),
                    _KitChip(label: 'ID Copy', color: AppColors.primaryBlue),
                    _KitChip(
                        label: 'Emergency Cash',
                        color: AppColors.transportOrange),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Delete Account Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete Account & Remove Data'),
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Account'),
                      content: const Text(
                        'Are you sure you want to delete your account? This action cannot be undone.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    try {
                      await AuthService().deleteAccount(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StaticInfoCard extends StatelessWidget {
  const _StaticInfoCard({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.gradientColors,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Color accentColor;
  final List<Color> gradientColors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final gradientStart = Color.alphaBlend(
      gradientColors.first.withOpacity(0.52),
      AppColors.surface,
    );
    final gradientMid = Color.alphaBlend(
      gradientColors.last.withOpacity(0.3),
      AppColors.surface,
    );
    final gradientEnd = Color.alphaBlend(
      gradientColors.last.withOpacity(0.38),
      AppColors.backgroundSoft,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            gradientStart,
            gradientMid,
            gradientEnd,
          ],
          stops: const [0.0, 0.45, 1.0],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accentColor.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.2),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: LinearGradient(
                colors: [
                  gradientColors.first,
                  gradientColors.last,
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      accentColor.withOpacity(0.42),
                      gradientColors.last.withOpacity(0.28),
                    ],
                  ),
                ),
                child: Icon(icon, color: accentColor, size: 18),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _AdviceRow extends StatelessWidget {
  const _AdviceRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

class _KitChip extends StatelessWidget {
  const _KitChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.38)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
