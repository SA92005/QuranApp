import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/colors.dart';
import 'package:quran_app/screens/splash_text.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.splash,
        body: Center(child: SplashText()),
      ),
    );
  }
}
