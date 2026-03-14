import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/theme/app_style.dart';

class SplashText extends StatelessWidget {
  const SplashText({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppStyle.splashText,
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            'القرآن الكريم',
            speed: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
