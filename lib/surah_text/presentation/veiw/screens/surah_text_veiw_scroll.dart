import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/theme/app_color.dart';
import 'package:quran_app/core/utilities/theme/app_style.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/surah_text/presentation/veiw/widgets/column_span.dart';

class SurahTextVeiwScroll extends StatelessWidget {
  const SurahTextVeiwScroll({
    super.key,
    required this.ayahs,
    required this.surahName,
  });
  final String surahName;
  final List<AyahsEntity> ayahs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      appBar: AppBar(
        title: Text(surahName, style: AppStyle.cardStyle),
        centerTitle: true,
        backgroundColor: AppColors.splash,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: .all(8),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE3E5DD),
            ),
            child: SingleChildScrollView(
              child: InteractiveViewer(
                maxScale: 3,
                minScale: 1,
                child: ColumnSpan(ayahs: ayahs),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
