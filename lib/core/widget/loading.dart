import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/theme/app_color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Easing.emphasizedAccelerate,
      duration: Duration(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.transparent,
      ),
      child: CircularProgressIndicator(color: AppColors.splash),
    );
  }
}
