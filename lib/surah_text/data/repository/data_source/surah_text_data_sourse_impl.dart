// import 'package:injectable/injectable.dart';
// import 'package:quran_app/core/helper/result_api.dart';
// import 'package:quran_app/home/data/model/quran_dto.dart';
// import 'package:quran_app/home/data/quran_dat/api/quran_api.dart';
// import 'package:quran_app/home/domain/entity/quran_entity.dart';
// import 'package:quran_app/surah_text/domain/repository/data_source/surah_text_data_source.dart';

// @Injectable(as: SurahTextDataSource)
// class SurahTextDataSourseImpl implements SurahTextDataSource {
//   SurahTextDataSourseImpl(this.quranApi);
//   QuranApi quranApi;
//   @override
//   Future<ResultApi<List<AyahsEntity>>> getSurahText(int surahNumber) async {
//     final result = await quranApi.getAPI();
//     switch (result) {
//       case SuccessAPI<QuranDto>():
//         final ayahDto = result.data;
//         final ayahsEntity = ayahDto!.data!.surahs![surahNumber].toEntity();
//         return SuccessAPI(ayahsEntity.ayahs);

//       case ErrorAPI<QuranDto>():
//         return ErrorAPI(result.errorMessage);
//     }
//   }
// }
