// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranEntityAdapter extends TypeAdapter<QuranEntity> {
  @override
  final int typeId = 0;

  @override
  QuranEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranEntity(
      code: fields[0] as int,
      status: fields[1] as String,
      data: fields[2] as DataEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, QuranEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataEntityAdapter extends TypeAdapter<DataEntity> {
  @override
  final int typeId = 1;

  @override
  DataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataEntity(
      surahs: (fields[0] as List).cast<SurahsEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.surahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SurahsEntityAdapter extends TypeAdapter<SurahsEntity> {
  @override
  final int typeId = 2;

  @override
  SurahsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahsEntity(
      number: fields[0] as int,
      name: fields[1] as String,
      englishName: fields[2] as String,
      englishNameTranslation: fields[3] as String,
      revelationType: fields[4] as String,
      ayahs: (fields[5] as List).cast<AyahsEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, SurahsEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyahsEntityAdapter extends TypeAdapter<AyahsEntity> {
  @override
  final int typeId = 3;

  @override
  AyahsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AyahsEntity(
      number: fields[0] as int,
      text: fields[1] as String,
      numberInSurah: fields[2] as int,
      juz: fields[3] as int,
      manzil: fields[4] as int,
      page: fields[5] as int,
      ruku: fields[6] as int,
      hizbQuarter: fields[7] as int,
      sajda: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AyahsEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter)
      ..writeByte(8)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
