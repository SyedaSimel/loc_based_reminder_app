import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loc_based_reminder_app/views/on_boarding/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds, then navigate to the Onboarding screen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 239, 224), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGO 1.png', // Your logo path
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10), // Space between logo and text
            const Text(
              'Map Memos',
              style: TextStyle(
                fontFamily:
                    'Poppins', // Ensure Poppins font is added in pubspec.yaml
                fontWeight: FontWeight.w600, // Semi-bold
                fontSize: 49,
                color: Color(0xFF907F46),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
