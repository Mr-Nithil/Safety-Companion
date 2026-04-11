import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:safety_companion/utils/app_colors.dart';

class SignOutWidget extends StatefulWidget {
  const SignOutWidget({super.key});

  @override
  State<SignOutWidget> createState() => _SignOutWidgetState();
}

class _SignOutWidgetState extends State<SignOutWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    const safetyAccent = AppColors.transportOrange;
    const safetyGradientColors = [
      AppColors.transportOrange,
      AppColors.primaryBlue,
    ];
    final safetyGradientStart = Color.alphaBlend(
      safetyGradientColors.first.withOpacity(0.52),
      AppColors.surface,
    );
    final safetyGradientMid = Color.alphaBlend(
      safetyGradientColors.last.withOpacity(0.3),
      AppColors.surface,
    );
    final safetyGradientEnd = Color.alphaBlend(
      safetyGradientColors.last.withOpacity(0.38),
      AppColors.backgroundSoft,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              border:
                  Border.all(color: AppColors.primaryBlue.withOpacity(0.35)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withOpacity(0.2),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
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
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryBlue.withOpacity(0.34),
                        AppColors.pharmacyTeal.withOpacity(0.28),
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0x30FFFFFF)),
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    color: AppColors.textPrimary,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Session & Security',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Signed in as ${user?.email ?? 'current user'}',
                        maxLines: 2,
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
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
                border: Border.all(
                    color: AppColors.liveSafeBorder.withOpacity(0.72)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pharmacyTeal.withOpacity(0.14),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LottieBuilder.network(
                        'https://lottie.host/9d7135c7-bc69-4445-a2f1-377b25d7df3b/hWmCUymVUv.json',
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter,
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = composition.duration
                            ..forward(from: 0.0)
                            ..addListener(() {
                              if (_controller.isCompleted) {
                                _controller.stop();
                              }
                            });
                        },
                      ),
                    ),
                  ),
                  //const SizedBox(height: ),
                  const Text(
                    'Signed in as...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedLabel,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? 'Signed in user',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.emergencyPrimary,
                          AppColors.emergencyDark,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.emergencyDark.withOpacity(0.4),
                          blurRadius: 14,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 168,
            child: Container(
              padding: const EdgeInsets.all(16),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    safetyGradientStart,
                    safetyGradientMid,
                    safetyGradientEnd,
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: safetyAccent.withOpacity(0.35)),
                boxShadow: [
                  BoxShadow(
                    color: safetyAccent.withOpacity(0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                  const BoxShadow(
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
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.transportOrange,
                          AppColors.primaryBlue,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                              safetyAccent.withOpacity(0.42),
                              AppColors.primaryBlue.withOpacity(0.28),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.tips_and_updates_outlined,
                          color: AppColors.transportOrange,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Stay Prepared, Stay Safe',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const _SafetyTipRow(
                    icon: Icons.contact_phone_outlined,
                    text: 'Keep emergency contacts updated',
                  ),
                  const SizedBox(height: 4),
                  const _SafetyTipRow(
                    icon: Icons.location_on_outlined,
                    text: 'Enable location sharing when needed',
                  ),
                  const SizedBox(height: 4),
                  const _SafetyTipRow(
                    icon: Icons.visibility_outlined,
                    text: 'Stay aware of your surroundings',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SafetyTipRow extends StatelessWidget {
  const _SafetyTipRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0x24FFFFFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 14, color: AppColors.textPrimary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFFF1F9FF),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
