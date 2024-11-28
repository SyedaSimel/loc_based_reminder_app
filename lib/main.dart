import 'package:flutter/material.dart';
import 'package:loc_based_reminder_app/views/splash/splash.dart';
//import '../views/on_boarding/on_boarding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
