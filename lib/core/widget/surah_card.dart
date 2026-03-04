import 'package:flutter/material.dart';
import 'package:quran_app/core/utilities/style.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({
    super.key,
    this.name,
    this.type,
    this.ayaNumber,
    this.onTap,
  });
  final String? name;
  final String? type;
  final int? ayaNumber;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.height,

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          focusColor: Color(0xff054C4C),
          splashColor: Color(0xff054C4C),
          hoverColor: Color(0xff054C4C),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$name', style: AppStyle.cardStyle),
                  Text(
                    type == 'Meccan' ? 'مكية' : 'مدنية ',
                    style: AppStyle.cardStyle,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('عدد الآيات', style: AppStyle.cardStyle),
                  Text('$ayaNumber', style: AppStyle.cardStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
