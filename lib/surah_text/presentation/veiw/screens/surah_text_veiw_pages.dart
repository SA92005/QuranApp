import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/assets/app_icons.dart';
import 'package:quran_app/core/utilities/theme/app_color.dart';
import 'package:quran_app/core/utilities/theme/app_style.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';

class SurahTextVeiwPages extends StatefulWidget {
  const SurahTextVeiwPages({
    super.key,
    required this.ayahs,
    required this.surahName,
  });

  final String surahName;
  final List<AyahsEntity> ayahs;

  @override
  State<SurahTextVeiwPages> createState() => _SurahTextVeiwState();
}

class _SurahTextVeiwState extends State<SurahTextVeiwPages> {
  List<List<InlineSpan>> pages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildPages();
  }

  void _buildPages() {
    pages.clear();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double currentHeight = 0;
    List<InlineSpan> currentPage = [];

    const basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";

    for (var ayah in widget.ayahs) {
      String ayahText = ayah.text;

      if (ayah.numberInSurah == 1) {
        ayahText = ayahText.replaceFirst(basmala, '');

        final basmalaPainter = TextPainter(
          text: const TextSpan(text: "$basmala\n"),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        );

        basmalaPainter.layout(maxWidth: screenWidth - 60);

        currentPage.add(const WidgetSpan(child: Center(child: Text(basmala))));

        currentHeight += basmalaPainter.height;
      }

      final textPainter = TextPainter(
        text: TextSpan(text: ayahText, style: AppStyle.ayahTextStyle),
        textDirection: TextDirection.rtl,
      );

      textPainter.layout(maxWidth: screenWidth - 60);

      if (currentHeight + textPainter.height > screenHeight - 200) {
        pages.add(currentPage);
        currentPage = [];
        currentHeight = 0;
      }

      currentPage.add(TextSpan(text: ayahText, style: AppStyle.ayahTextStyle));

      currentPage.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppIcons.ayahIcon, width: 35, height: 35),
              Text('${ayah.numberInSurah}'),
            ],
          ),
        ),
      );

      currentHeight += textPainter.height;
    }

    if (currentPage.isNotEmpty) {
      pages.add(currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      appBar: AppBar(
        title: Text(widget.surahName, style: AppStyle.cardStyle),
        centerTitle: true,
        backgroundColor: AppColors.splash,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFE3E5DD),
                ),
                padding: const EdgeInsets.all(16),
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 2,
                  child: Text.rich(TextSpan(children: pages[index])),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
