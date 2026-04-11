import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safety_companion/utils/app_colors.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key, required this.userID});
  final String userID;

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data?.data() as Map<String, dynamic>?;
        if (data == null) {
          return const Text('No profile data available');
        }

        return UserCard(
          data: data,
          userID: widget.userID,
        );
      },
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.data, required this.userID});
  final Map<String, dynamic> data;
  final String userID;

  @override
  Widget build(BuildContext context) {
    final rows = [
      _InfoRow(
        label: 'First Name',
        value: '${data['first name'] ?? '-'}',
        icon: Icons.badge_outlined,
        accent: AppColors.primaryBlue,
      ),
      _InfoRow(
        label: 'Last Name',
        value: '${data['last name'] ?? '-'}',
        icon: Icons.person_outline,
        accent: AppColors.pharmacyTeal,
      ),
      _InfoRow(
        label: 'Email',
        value: '${data['email'] ?? '-'}',
        icon: Icons.email_outlined,
        accent: AppColors.safeGreen,
      ),
      _InfoRow(
        label: 'Birthday',
        value: '${data['birthday'] ?? '-'}',
        icon: Icons.cake_outlined,
        accent: AppColors.transportOrange,
      ),
      _InfoRow(
        label: 'Address',
        value: '${data['address'] ?? '-'}',
        icon: Icons.home_outlined,
        accent: AppColors.primaryBlue,
      ),
      _InfoRow(
        label: 'Emergency Contact Number',
        value: '${data['emergency contact number'] ?? '-'}',
        icon: Icons.call_outlined,
        accent: AppColors.pharmacyTeal,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surface,
            AppColors.backgroundSoft,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.liveSafeBorder.withOpacity(0.7)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue,
                    AppColors.pharmacyTeal,
                    AppColors.safeGreen,
                    AppColors.transportOrange,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(rows.length, (index) {
                final isLast = index == rows.length - 1;
                return Column(
                  children: [
                    rows[index],
                    if (!isLast)
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.divider,
                      ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: accent.withOpacity(0.55), width: 3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 18,
                color: accent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedLabel,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
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
