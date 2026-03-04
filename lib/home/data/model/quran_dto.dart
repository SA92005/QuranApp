import 'package:quran_app/home/domain/entity/quran_entity.dart';

class QuranDto {
  int? code;
  String? status;
  DataDto? data;

  QuranDto({this.code, this.status, this.data});

  QuranDto.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }
  QuranEntity toEntity() => QuranEntity(
    code: code ?? 0,
    data: data?.toEntity() ?? DataDto(surahs: []).toEntity(),
  );
}

class DataDto {
  List<SurahsDto>? surahs;

  DataDto({this.surahs});

  DataDto.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = <SurahsDto>[];
      json['surahs'].forEach((v) {
        surahs!.add(SurahsDto.fromJson(v));
      });
    }
  }
  DataEntity toEntity() =>
      DataEntity(surahs: surahs?.map((e) => e.toEntity()).toList() ?? []);
}

class SurahsDto {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<AyahsDto>? ayahs;

  SurahsDto({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  SurahsDto.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = <AyahsDto>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(AyahsDto.fromJson(v));
      });
    }
  }
  SurahsEntity toEntity() => SurahsEntity(
    ayahs: ayahs?.map((e) => e.toEntity()).toList() ?? [],
    englishName: englishName ?? '',
    englishNameTranslation: englishNameTranslation ?? '',
    name: name ?? '',
    number: number ?? 0,
    revelationType: revelationType ?? '',
  );
}

class AyahsDto {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  AyahsDto({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  AyahsDto.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'] is bool ? json['sajda'] : json['sajda'] != null;
  }
  AyahsEntity toEntity() => AyahsEntity(
    hizbQuarter: hizbQuarter ?? 0,
    juz: juz ?? 0,
    manzil: manzil ?? 0,
    number: number ?? 0,
    numberInSurah: numberInSurah ?? 0,
    page: page ?? 0,
    ruku: ruku ?? 0,
    sajda: sajda ?? false,
    text: text ?? '',
  );
}
