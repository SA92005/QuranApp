import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/theme/app_style.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';

class ColumnSpan extends StatelessWidget {
  const ColumnSpan({super.key, required this.ayahs});
  final String basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
  final List<AyahsEntity> ayahs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(basmala, style: AppStyle.ayahTextStyle)],
        ),
        Text.rich(
          softWrap: true,
          //locale: Locale('ar'),
          textAlign: TextAlign.justify,
          TextSpan(children: _spans(ayahs)),
        ),
      ],
    );
  }
}

List<InlineSpan> _spans(List<AyahsEntity> ayahs) {
  List<InlineSpan> list = [];
  String basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";

  for (var ayah in ayahs) {
    String ayahText = ayah.text;

    if (ayah.numberInSurah == 1) {
      ayahText = ayahText.replaceFirst(basmala, '');
    }

    list.add(
      TextSpan(
        text: ayahText,
        style: AppStyle.ayahTextStyle,
        children: [
          TextSpan(
            text: ' ۝${_convertToArabicNumber(ayah.numberInSurah)} ',
            style: AppStyle.ayahNuumberTextStyle,
          ),
          //const TextSpan(text: " "),
        ],
      ),
    );
  }
  return list;
}

String _convertToArabicNumber(int number) {
  const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  return number
      .toString()
      .split('')
      .map((d) => arabicDigits[int.parse(d)])
      .join();
}
