import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/di/injectable.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/home/presentation/view/screens/home_screen.dart';

void main() async {
  configureDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(QuranEntityAdapter());
  Hive.registerAdapter(DataEntityAdapter());
  Hive.registerAdapter(SurahsEntityAdapter());
  Hive.registerAdapter(AyahsEntityAdapter());
  await Hive.openBox<QuranEntity>('quran_box');
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
