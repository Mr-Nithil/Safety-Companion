import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safety_companion/auth/main_screen.dart';
import 'package:safety_companion/utils/app_colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryBlue,
          secondary: AppColors.safeGreen,
          error: AppColors.emergencyPrimary,
          surface: AppColors.surface,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
