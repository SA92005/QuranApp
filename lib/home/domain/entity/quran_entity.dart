import 'package:hive_flutter/hive_flutter.dart';
part 'quran_entity.g.dart';

@HiveType(typeId: 0)
class QuranEntity {
  @HiveField(0)
  int code;
  @HiveField(1)
  String status;
  @HiveField(2)
  DataEntity data;

  QuranEntity({this.code = 0, this.status = '', DataEntity? data})
    : data = data ?? DataEntity();
}

@HiveType(typeId: 1)
class DataEntity {
  @HiveField(0)
  List<SurahsEntity> surahs;

  DataEntity({this.surahs = const []});
}

@HiveType(typeId: 2)
class SurahsEntity {
  @HiveField(0)
  int number;
  @HiveField(1)
  String name;
  @HiveField(2)
  String englishName;
  @HiveField(3)
  String englishNameTranslation;
  @HiveField(4)
  String revelationType;
  @HiveField(5)
  List<AyahsEntity> ayahs;

  SurahsEntity({
    this.number = 0,
    this.name = '',
    this.englishName = '',
    this.englishNameTranslation = '',
    this.revelationType = '',
    this.ayahs = const [],
  });
}

@HiveType(typeId: 3)
class AyahsEntity {
  @HiveField(0)
  int number;
  @HiveField(1)
  String text;
  @HiveField(2)
  int numberInSurah;
  @HiveField(3)
  int juz;
  @HiveField(4)
  int manzil;
  @HiveField(5)
  int page;
  @HiveField(6)
  int ruku;
  @HiveField(7)
  int hizbQuarter;
  @HiveField(8)
  bool sajda;

  AyahsEntity({
    this.number = 0,
    this.text = '',
    this.numberInSurah = 0,
    this.juz = 0,
    this.manzil = 0,
    this.page = 0,
    this.ruku = 0,
    this.hizbQuarter = 0,
    this.sajda = false,
  });
}
