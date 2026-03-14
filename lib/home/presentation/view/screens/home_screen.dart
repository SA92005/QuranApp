import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/theme/app_color.dart';
import 'package:quran_app/home/presentation/view/screens/surahs_names.dart';
import 'package:quran_app/screens/splash_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Surah()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      body: Center(child: SplashText()),
    );
  }
}
