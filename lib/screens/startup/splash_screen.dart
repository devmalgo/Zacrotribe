import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/demo/demo_home_page.dart';
import 'package:zacro_tribe/screens/home/home_page.dart';
import 'package:zacro_tribe/screens/startup/onboarding_screen.dart';
import 'package:zacro_tribe/utils/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  void _checkLoginStatus() {
    _authService.isLoggedIn().then((isLoggedIn) {
      if (isLoggedIn) {
        // Navigate to HomePage if user is logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DemoHomePage()),
        );
      } else {
        // Navigate to OnboardingScreen if user is not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    }).catchError((error) {
      // Handle error if needed
      print("Error checking login status: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
